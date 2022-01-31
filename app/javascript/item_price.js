window.addEventListener('load', () => {
  console.log("OK");
  // 金額を入力した数値をpriceInputという変数に格納する

  const priceInput = document.getElementById("item-price");
  console.log(priceInput);
  priceInput.addEventListener("input", () => {
  console.log("イベント発火");
  const inputValue = priceInput.value;
  console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.floor(inputValue * 0.9)
    
  })
});

