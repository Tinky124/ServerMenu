window.addEventListener('message', function (event) {
  var item = event.data;
  if (item.type == "otvorimenu") {
      $(".container").fadeIn();
  }
});

$(document).keyup(function (e) {
  if (e.keyCode == 27) {
      $(".container").fadeOut();
      $(".prijavabuga").fadeOut();
      $(".prijava-igraca").fadeOut();
      $(".prijedlozi").fadeOut();
      $.post('https://servermenu/close', JSON.stringify({}));
  }
});

function zatvoricontainer() {
    $(".container").slideUp(400);
    $.post('https://servermenu/close', JSON.stringify({}));
}
function prijavabuga() {
    $(".container").fadeOut();
    $(".prijavabuga").fadeIn();
}

function prijedlozi() {
    $(".container").fadeOut();
    $(".prijedlozi").fadeIn();
}

function prijavaigraca() {
    $(".container").fadeOut();
    $(".prijava-igraca").fadeIn();
}

function vratisenazad() {
    $(".prijavabuga").fadeOut();
    $(".container").fadeIn();
}

function vratisenazadprijedlozi() {
    $(".prijedlozi").fadeOut();
    $(".container").fadeIn();
}

function vratisenazadprijavaigraca() {
    $(".prijava-igraca").fadeOut();
    $(".container").fadeIn();
}


function dugmesend() {
    var discordime = document.getElementById('discordime')
    var why = document.getElementById('why')
    data = [discordime, why];
    $.post('https://servermenu/bugreport',
      JSON.stringify({  
        discordime: $("#discordime").val(),
        why: $("#why").val(),
      })
    );
    $(".prijavabuga").fadeOut();
    $(".container").fadeIn();
    document.getElementById('discordime').value = ''
    document.getElementById('why').value = ''
}


function posaljiprijedlog() {
    var discordimeprijedloga = document.getElementById('discordimeprijedloga')
    var prijedlog = document.getElementById('prijedlogtext')
    data = [discordimeprijedloga, prijedlogtext];
    $.post('https://servermenu/prijedlog',
      JSON.stringify({  
        discordimeprijedloga: $("#discordimeprijedloga").val(),
        prijedlogtext: $("#prijedlogtext").val(),
      })
    );
    $(".prijedlozi").fadeOut();
    $(".container").fadeIn();
    document.getElementById('discordimeprijedloga').value = ''
    document.getElementById('prijedlogtext').value = ''
}

function posaljiprijavuigraca() {
    var discordimeprijaveigraca = document.getElementById('discordimeprijaveigraca')
    var discordimeprijaveigracatarget = document.getElementById('discordimeprijaveigracatarget')
    var prijavatext = document.getElementById('prijavatext')
    data = [discordimeprijaveigraca, discordimeprijaveigracatarget, prijavatext];
    $.post('https://servermenu/reportplayer',
      JSON.stringify({  
        discordimeprijedloga: $("#discordimeprijaveigraca").val(),
        discordimeprijaveigracatarget: $("#discordimeprijaveigracatarget").val(),
        prijavatext: $("#prijavatext").val(),
      })
    );
    $(".prijava-igraca").fadeOut();
    $(".container").fadeIn();
    document.getElementById('discordimeprijedloga').value = ''
    document.getElementById('discordimeprijaveigracatarget').value = ''
    document.getElementById('prijavatext').value = ''
}


