# eCommerce System

This project covers a series of improvements in the system due to the changing needs of the entity. The new funcionality extends to products with associations of color and size, an independent stock variable and the addition of subcategories and coupons. Changes are summarised in the model diagram. 

- [eCommerce System](#ecommerce-system)
  * [Ruby & Rails version](#ruby---rails-version)
    + [1. Model Diagram](#1-model-diagram)
    + [2. Making the model and relations for Variant](#2-making-the-model-and-relations-for-variant)
    + [3. Making the model and relations for Size and Color](#3-making-the-model-and-relations-for-size-and-color)
    + [4. Implementing subcategories](#4-implementing-subcategories)
    + [5. Category scope](#5-category-scope)
    + [6. Implementing the products list](#6-implementing-the-products-list)
    + [7. Modifications in the model OrderItem](#7-modifications-in-the-model-orderitem)
    + [8. Coupons](#8-coupons)

## Ruby & Rails version

* Ruby 2.4.5
* Rails 5.2.3

### 1. Model Diagram

Initial state of the platform:

![diagram1](/app/assets/images/ecommerce_system.png)

The changes are describe in the next flowchart:

![diagram2](/app/assets/images/ecommerce.drawio.png)

- Variant will contain the association of the Product with Color an Size.
- Category works as a reflexive association.
- UserCoupon is related to the Order for a particular User.

### 2. Making the model and relations for Variant

First things first: the model of Color and Size is generated using the scaffold command:
```
rails g scaffold color name
rails g scaffold size name
```

Next, the model Variant is generated:
```
rails g model Variant size:references color:references product:references stock:integer
```

Then, the relations are added in the models:

```
class Product < ApplicationRecord
  has_many :variants
  has_many :colors, through: :variants, dependent: :destroy
  has_many :sizes, through: :variants, dependent: :destroy
end
```

```
class Variant < ApplicationRecord
  belongs_to :size
  belongs_to :color
  belongs_to :product
end
```

And because stock:integer is already included in the model Variant it is remove from the model Product:

```
rails g migration removeStockFromProduct stock:integer
```

### 3. Making the model and relations for Size and Color

Since the models were previously made for each of them, the addition of the relations looks like:

```
class Size < ApplicationRecord
    has_many :variants
    has_many :products, through: :variants, dependent: :destroy
end
```

```
class Color < ApplicationRecord
    has_many :variants
    has_many :products, through: :variants, dependent: :destroy
end
```

### 4. Implementing subcategories

Let's remember that Category works as reflexive association so it will contain new Categories inside. This way will provide one father for the different categories that would be incorporated. These new Categories are the subcategories and are generated:

```
rails g migration AddCategoryToCategory category:references  
```

The relation is incorporated in the model:

```
class Category < ApplicationRecord
  has_many :sub_categories, class_name: "Category", foreign_key: "category_id", dependent: :destroy						
  belongs_to :main_category, class_name: "Category", foreign_key: "category_id", optional: true						
end
```

### 5. Category scope 

### 6. Implementing the products list 

### 7. Modifications in the model OrderItem

The model OrdenItem used to be directly related with Product but, as it can be seen in the flowchart, after the changes is Variant the one that contains the key associations. Because of this, the reference of Variant is added to OrderItem just as:

```
rails g migration AddVariantToOrderItem variant:references
```

And the reference of Product is remove from OrderItem, since they are not related anymore.

```
rails g migration removeProductFromOrderItem product:references
```

### 8. Coupons 

The coupons for specific clients are incorporated generating first the model of Coupon.

```
rails g scaffold Coupon name code discount:integer 
```

The UserCoupon would provide the associations between the model User, Coupon and Order. The active attribute means if it's been expended (it's put as "default: false" in the migration).

```
rails g model UserCoupon user:references coupon:references order:references active:boolean
```

The relations are added in the model in this way:

```
class User < ApplicationRecord
  has_many :user_coupons
  has_many :coupons, through: :user_coupons, dependent: :destroy
  has_many :orders, through: :user_coupons, dependent: :destroy
end

```

```
class Coupon < ApplicationRecord
    has_many :user_coupons
    has_many :users, through: :user_coupons, dependent: :destroy  
    has_many :orders, through: :user_coupons, dependent: :destroy
end
```

```
class Order < ApplicationRecord
  has_many :user_coupons
  has_many :coupons, through: :user_coupons, dependent: :destroy
  has_many :users, through: :user_coupons, dependent: :destroy
end
```