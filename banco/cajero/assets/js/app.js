function login(){
    window.location.replace(`/banco/cajero/inicio.php`);
}

function retiros(){
    window.location.replace(`/banco/cajero/retiros.php`);
    
}

function depositos(){
    window.location.replace(`/banco/cajero/depositos.php`);
}

function transferencias(){
    window.location.replace(`/banco/cajero/transferencias.php`);
}

function movimientos(){
    window.location.replace(`/banco/cajero/movimientos.php`);
}

var triggerTabList = Array.prototype.slice.call(document.querySelectorAll('#myTab button'))
triggerTabList.forEach(function (triggerEl) {
  var tabTrigger = new bootstrap.Tab(triggerEl)

  triggerEl.addEventListener('click', function (event) {
    event.preventDefault()
    tabTrigger.show()
  })
})
