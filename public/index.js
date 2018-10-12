var productTemplate = document.querySelector('#product-card');
var productContainer = document.querySelector('.row');

axios.get("http://localhost:3000/api/products").then(function(response) {
  var products = response.data;
  console.log(products);

  products.forEach(function(product) {
    var productClone = productTemplate.content.cloneNode(true);

    productClone.querySelector('.product-title').innerText = product.name;
    productClone.querySelector('.description').innerText = product.description;
    productClone.querySelector('.price').innerText = product.price;

    productClone.querySelector('img').src = product.image_url;



    productContainer.appendChild(productClone);
  });
});