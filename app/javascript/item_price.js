window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById('add-tax-price')
    const taxValue = Math.floor(inputValue * 0.10)
    const profit = document.getElementById('profit')
    addTaxDom.innerHTML = taxValue.toLocaleString()
    profit.innerHTML = (inputValue - taxValue).toLocaleString()
  })
});