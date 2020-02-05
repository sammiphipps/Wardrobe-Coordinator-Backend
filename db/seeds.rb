# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
OutfitItem.destroy_all
Outfit.destroy_all
ClothingItem.destroy_all
ClothingCategory.destroy_all
User.destroy_all

top = ClothingCategory.create(
    name: "top"
)

bottom = ClothingCategory.create(
    name: "bottom"
)

sammiphipps = User.create(
    username: "sammiphipps",
    password: "123"
)

test = User.create(
    username: "test",
    password: "test"
)

ClothingItem.create(
    image_url: "https://i.pinimg.com/originals/01/82/a3/0182a3e739a58f7f217a34eb7341d9e3.png",
    clothing_type: "t-shirt",
    color: "black",
    clothing_category: top,
    user: sammiphipps
)

ClothingItem.create(
    image_url: "https://i.ya-webdesign.com/images/women-dress-png-6.png",
    clothing_type: "casual dress",
    color: "red polka dots",
    clothing_category: top,
    user: sammiphipps
)

ClothingItem.create(
    image_url: "https://i.pinimg.com/originals/da/e8/96/dae896db0346af3c4f5a2ef6f50e93ec.png",
    clothing_type: "t-shirt",
    color: "black",
    clothing_category: top,
    user:sammiphipps
)

ClothingItem.create(
    image_url: "https://gloimg.chinabrands.com/cb/pdm-product-pic/Clothing/2019/02/13/grid-img/1550021232388477261.png",
    clothing_type: "blouse",
    color: "black and white",
    clothing_category: top,
    user:sammiphipps
)

ClothingItem.create(
    image_url: "https://cdn.shopify.com/s/files/1/0064/8760/5321/products/C193SK02_zm_ee8a044d-c4d8-4b91-b447-0c57251bb088.png?v=1569940782",
    clothing_type: "skirt",
    color: "black",
    clothing_category: bottom,
    user: sammiphipps
)

ClothingItem.create(
    image_url: "https://craaazyfashion.files.wordpress.com/2015/06/anf_86818_01_prod1.png",
    clothing_type: "jean shorts",
    color: "blue", 
    clothing_category: bottom,
    user: sammiphipps
)

ClothingItem.create(
    image_url: "https://i.pinimg.com/originals/1a/65/5f/1a655f78d186fe1cdfcc331088c262d5.png",
    clothing_type: "jeans",
    color: "dark blue",
    clothing_category: bottom,
    user: sammiphipps
)