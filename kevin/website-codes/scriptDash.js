const ctx = document.getElementById('graficoLinha');

new Chart(ctx, {
  type: 'line',
  data: {
    labels: ['12:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
    datasets: [
      {
        label: 'Luminosidade',
        data: [30000, 10000, 5000, 25000, 22000, 23000],
        borderWidth: 1,
        backgroundColor: '#ddd',
        borderColor: '#fff',
        tension: 0.5,
      },
    ]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true,
        ticks: {
          color: '#fff'
        },
        grid: {
          color: '#000'
        }
      },
      x: {
        ticks: {
          color: '#fff'
        },
        grid: {
          color: '#000'
        }
      }
    }
  }
});

const ctx2 = document.getElementById('graficoColuna');

new Chart(ctx2, {
  type: 'bar',
  data: {
    labels: ['12:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
    datasets: [
      {
        label: 'Temperatura',
        data: [22, 24, 27, 23, 20, 18],
        borderWidth: 1,
        backgroundColor: '#ddd',
      },
    ]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true,
        ticks: {
          color: '#fff'
        },
        grid: {
          color: '#000'
        }
      },
      x: {
        ticks: {
          color: '#fff'
        },
        grid: {
          color: '#000'
        }
      }
    }
  }
});

Chart.defaults.backgroundColor = '#9BD0F5';