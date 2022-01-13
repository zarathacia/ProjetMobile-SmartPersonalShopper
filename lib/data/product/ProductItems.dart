class Product {
  final String image, title, description;
  final int id;
  final double price;
  Product(
      {required this.id,
        required this.image,
        required this.title,
        required this.description,
        required this.price});
}

List<Product> products = [
  Product(
      id: 0,
      title: "Hrissa sicam",
      image: "images/hrissa.png",
      description: "Lorem ipsum dolor sit amet",
      price: 0.850),
  Product(
      id: 1,
      title: "Pizza",
      image: "images/pizza.png",
      description: "Lorem ipsum dolor sit amet",
      price: 20.850),
  Product(
      id: 5,
      title: "Liquide vaisselle citron PRIL",
      image: "images/pril.png",
      description: "2.5L",
      price: 7.990),
  Product(
      id: 6,
      title: "Boga",
      image: "images/boga.png",
      description: "Lorem ipsum dolor sit amet",
      price: 2.850),
  Product(
      id: 7,
      title: "Tomates",
      image: "images/tomate.png",
      description: "Lorem ipsum dolor sit amet",
      price: 1.850),
  Product(
    id: 9,
    title: 'Chocolat en poudre instantané',
    description: '200g',
    price: 2.090,
    image: 'images/choco.png',
  ),
  Product(
    id: 10,
    title: 'Déodorant Dark temptation',
    description: 'le flacon de 160ml',
    price: 6.130,
    image: 'images/deodo.png',
  ),
  Product(
    id: 11,
    title: 'Pomme',
    description: '1kg',
    price: 2.390,
    image: 'images/pomme.jpg',
  ),
  Product(
    id: 12,
    title: 'Eau minerale 1.5L SAFIA ',
    image: 'images/safia.png',
    price: 3.300,
    description: 'pack de 6',
  ),
  Product(
    id: 13,
    title: 'Riz Blanc',
    description: '1kg',
    price: 1.86,
    image: 'images/riz_blanc.png',
  ),
  Product(
      id: 14,
      title: "120W hand mixer",
      image: "images/mixeur.jpg",
      description: "Lorem ipsum dolor sit amet",
      price: 52.850),
  Product(
      id: 15,
      title: "Marseille soap powder machine laundry",
      image: "images/omo.jpg",
      description: "Lorem ipsum dolor sit amet",
      price: 2.850),
  Product(
      id: 16,
      title: "Blender 1.5L",
      image: "images/robo.jpg",
      description: "Lorem ipsum dolor sit amet",
      price: 82.850),
  Product(
      id: 17,
      title: "Deluxe 2-ply napkins 30x30cm",
      image: "images/papier.jpg",
      description: "Lorem ipsum dolor sit amet",
      price: 2.850),
  Product(
      id: 18,
      title: "Aluminum container 160x160cm",
      image: "images/alu.jpg",
      description: "Lorem ipsum dolor sit amet",
      price: 3.850),
  Product(
      id: 19,
      title: "Ice cube bags",
      image: "images/sahet.jpg",
      description: "Lorem ipsum dolor sit amet",
      price: 1.850),
  Product(
      id: 20,
      title: "Chilli and lemon potato chips",
      image: "images/chips.jpg",
      description: "Lorem ipsum dolor sit amet",
      price: 1.850),
  Product(
      id: 21,
      title: "Ham Turkey",
      image: "images/jambon.jpg",
      description: "Lorem ipsum dolor sit amet",
      price: 1.850),
  Product(
      id: 22,
      title: "Cheese and crispy cookies Snack",
      image: "images/kaki.jpg",
      description: "Lorem ipsum dolor sit amet",
      price: 1.850),
];