# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ClothingItem.destroy_all

ClothingItem.create(
    image_url: "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTR7d0JxK06CfziiNWqi3k4ufVnvFUud6As6StlY87UncOr7j9gpOb-p1xy2IA3Ql_EJJ16JGA5Mz7MxcCHfMjjXumY3POmd8NP7bxZwIBcev1WM41uSRYyuw&usqp=CAE",
    clothing_type: "blouse",
    color: "green"
)

ClothingItem.create(
    image_url: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRyPaRn0wvE9yaVsNdSi99KZZ233umyb8a4mpzzxrI8Eftdw1yvEkCmakPTHnsrM_B2v05JT5YVD8xAqhxJoLqRKXKOSRqAUYLYtXqnVjgCXXiSR2PbI4n0dw&usqp=CAE",
    clothing_type: "jeans",
    color: "dark blue"
)

ClothingItem.create(
    image_url: "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTv98SHk6_IXnnBmXVfpgkkjPiBcrbIsR0YWLpipY8sH9e1miSUx1K4ruD0DLCO7KOljQGR9nro0-Jsdz7eZXm8aZMz_T67r2Xy903Gchc&usqp=CAE",
    clothing_type: "casual dress",
    color: "teal"
)

ClothingItem.create(
    image_url: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRoPGlz2pS3wAdXcW3YhgsakGGRj9EoFvsQ-p-6jo2Gy7S5e-C3kcEAN8u4iJA6h9OauYyx2lwGJ8UtUBghjpslEJ3vGOA_z-JXuLnX7MvixX3Mn_BVzcT2FQ&usqp=CAE",
    clothing_type: "sweatpants",
    color: "black"
)

ClothingItem.create(
    image_url: "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQAOrvfHBdElD7l6DeSie_YWyh0xQtcxk9JVebnWtkU_6uqm_YjO4a_zdXjSTmGBg4YdAfYQ_cY6bjTZwmfWZAHDCGKqTmtOPPfmPKgqm2iUT9bNmEjsGU2UA&usqp=CAE",
    clothing_type: "long sleeve t-shirt",
    color: "orange"
)