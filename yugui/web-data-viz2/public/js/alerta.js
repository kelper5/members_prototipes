let viveiros_alerta = JSON.parse(sessionStorage.ALERTA || "[]");

function obterdados(idViveiro, biomassa_media) {
    fetch(`/capturas/tempo-real/${idViveiro}`)
        .then(resposta => {
            if (resposta.status == 200) {
                resposta.json().then(resposta => {
                    let ire = biomassa_media * resposta[0].temperatura * resposta[0].luminosidade / 15000000

                    let novoArray = [];

                    for (let i = 0; i < viveiros_alerta.length; i++) {
                        if (viveiros_alerta[i].idViveiro !== idViveiro) {
                            novoArray.push(viveiros_alerta[i]);
                        }
                    }

                    if (ire > 0.5) {
                        novoArray.push({ idViveiro, ire });
                    }

                    viveiros_alerta = novoArray;
                    sessionStorage.ALERTA = JSON.stringify(viveiros_alerta);
                })
            }
            else {
                console.error(`Nenhum dado encontrado para o id ${idViveiro} ou erro na API`);
            }
        })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados do viveiro p/ gráfico: ${error.message}`);
        });
};


// function alertar(resposta, idViveiro) {
//     var temp = resposta[0].temperatura;

//     var grauDeAviso = '';

//     var limites = {
//         muito_quente: 23,
//         quente: 22,
//         ideal: 20,
//         frio: 10,
//         muito_frio: 5
//     };

//     var classe_temperatura = 'cor-alerta';

//     if (temp >= limites.muito_quente) {
//         classe_temperatura = 'cor-alerta perigo-quente';
//         grauDeAviso = 'perigo quente'
//         grauDeAvisoCor = 'cor-alerta perigo-quente'
//         exibirAlerta(temp, idViveiro, grauDeAviso, grauDeAvisoCor)
//     }
//     else if (temp < limites.muito_quente && temp >= limites.quente) {
//         classe_temperatura = 'cor-alerta alerta-quente';
//         grauDeAviso = 'alerta quente'
//         grauDeAvisoCor = 'cor-alerta alerta-quente'
//         exibirAlerta(temp, idViveiro, grauDeAviso, grauDeAvisoCor)
//     }
//     else if (temp < limites.quente && temp > limites.frio) {
//         classe_temperatura = 'cor-alerta ideal';
//         removerAlerta(idViveiro);
//     }
//     else if (temp <= limites.frio && temp > limites.muito_frio) {
//         classe_temperatura = 'cor-alerta alerta-frio';
//         grauDeAviso = 'alerta frio'
//         grauDeAvisoCor = 'cor-alerta alerta-frio'
//         exibirAlerta(temp, idViveiro, grauDeAviso, grauDeAvisoCor)
//     }
//     else if (temp <= limites.muito_frio) {
//         classe_temperatura = 'cor-alerta perigo-frio';
//         grauDeAviso = 'perigo frio'
//         grauDeAvisoCor = 'cor-alerta perigo-frio'
//         exibirAlerta(temp, idViveiro, grauDeAviso, grauDeAvisoCor)
//     }

//     var card;

//     if (document.getElementById(`temp_aquario_${idViveiro}`) != null) {
//         document.getElementById(`temp_aquario_${idViveiro}`).innerHTML = temp + "°C";
//     }

//     if (document.getElementById(`card_${idViveiro}`)) {
//         card = document.getElementById(`card_${idViveiro}`)
//         card.className = classe_temperatura;
//     }
// }

// function exibirAlerta(temp, idViveiro, grauDeAviso, grauDeAvisoCor) {
//     var indice = alertas.findIndex(item => item.idViveiro == idViveiro);

//     if (indice >= 0) {
//         alertas[indice] = { idViveiro, temp, grauDeAviso, grauDeAvisoCor }
//     } else {
//         alertas.push({ idViveiro, temp, grauDeAviso, grauDeAvisoCor });
//     }

//     exibirCards();
// }

// function removerAlerta(idViveiro) {
//     alertas = alertas.filter(item => item.idViveiro != idViveiro);
//     exibirCards();
// }

// function exibirCards() {
//     alerta.innerHTML = '';

//     for (var i = 0; i < alertas.length; i++) {
//         var mensagem = alertas[i];
//         alerta.innerHTML += transformarEmDiv(mensagem);
//     }
// }

// function transformarEmDiv({ idViveiro, temp, grauDeAviso, grauDeAvisoCor }) {

//     var descricao = JSON.parse(sessionStorage.AQUARIOS).find(item => item.id == idViveiro).descricao;
//     return `
//     <div class="mensagem-alarme">
//         <div class="informacao">
//             <div class="${grauDeAvisoCor}">&#12644;</div> 
//             <h3>${descricao} está em estado de ${grauDeAviso}!</h3>
//             <small>Temperatura capturada: ${temp}°C.</small>   
//         </div>
//         <div class="alarme-sino"></div>
//     </div>
//     `;
// }

function atualizacaoPeriodica() {
    JSON.parse(sessionStorage.VIVEIROS).forEach(item => {
        obterdados(item.idViveiro, item.biomassa_media)
    });
    setTimeout(atualizacaoPeriodica, 5000);
}
