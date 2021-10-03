# eCommerce System

This project covers a series of improvements in the system due to the changing needs of the entity. The new funcionality extends to products with associations of color and size, an independent stock variable and the addition of subcategories and coupons. Changes are summarised in the model diagram. 

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

Then, the relations are made in the models:

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




This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
