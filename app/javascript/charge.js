function charge (){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("keyup", () => {
    const salesCommission = (Math.floor(itemPrice.value * 0.1)) || 0;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${salesCommission.toLocaleString()}`;
    const salesProfit = (parseInt(itemPrice.value) - parseInt(salesCommission)) || 0;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${salesProfit.toLocaleString()}`;
  });
};

window.addEventListener('load', charge); 