window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  })
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = "入力した金額をもとに販売手数料を計算する処理"
});