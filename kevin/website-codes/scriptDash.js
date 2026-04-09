const ctx = document.getElementById('graficoLinha');

  new Chart(ctx, {
    type: 'line',
    data: {
      labels: ['12:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
      datasets: [
        {
            label: 'Temperatura',
            data: [30, 29, 28, 25, 22, 23],
            borderWidth: 1
        },
        {
            label: 'Umidade',
            data: [80, 82, 80, 85, 80, 83],
            borderWidth: 1
        }
    ]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });

  const ctx2 = document.getElementById('graficoColuna');

  new Chart(ctx2, {
    type: 'bar',
    data: {
      labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho'],
      datasets: [
        {
            label: 'Temperatura Média',
            data: [22, 24, 27, 23, 20, 18],
            borderWidth: 1
        },
        {
            label: 'Umidade Média',
            data: [90, 89, 93, 87, 88, 82],
            borderWidth: 1
        }
    ]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });