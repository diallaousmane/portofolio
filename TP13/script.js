function calculer() {
    let q1 = document.getElementById("q1").value;
    let p1 = document.getElementById("p1").value;
    let q2 = document.getElementById("q2").value;
    let p2 = document.getElementById("p2").value;
    let q3 = document.getElementById("q3").value;
    let p3 = document.getElementById("p3").value;
  
    let r1 = q1 * p1;
    let r2 = q2 * p2;
    let r3 = q3 * p3;
  
    document.getElementById("r1").value = r1;
    document.getElementById("r2").value = r2;
    document.getElementById("r3").value = r3;
  
    let total = r1 + r2 + r3;
    document.getElementById("total").value = total;
  }
  
  function reinit() {
    document.getElementById("q1").value = "";
    document.getElementById("p1").value = "";
    document.getElementById("r1").value = "";
  
    document.getElementById("q2").value = "";
    document.getElementById("p2").value = "";
    document.getElementById("r2").value = "";
  
    document.getElementById("q3").value = "";
    document.getElementById("p3").value = "";
    document.getElementById("r3").value = "";
  
    document.getElementById("total").value = "";
  }