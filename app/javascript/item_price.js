function Input() {
const priceInput = document.getElementById("item-price")
const addTaxPrice = document.getElementById("add-tax-price")
const Profit = document.getElementById("profit")

priceInput.addEventListener("input" ,() => {
  const inputValue = priceInput.value;
  Fee = Math.floor(inputValue*0.1)
  addTaxPrice.innerHTML = Fee;
  Benefit = Math.floor(inputValue*0.9);
  Profit.innerHTML = Benefit;

})
}
window.addEventListener('load', Input)
