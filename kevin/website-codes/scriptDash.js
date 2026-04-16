const ctx = document.getElementById('graficoLinha');

new Chart(ctx, {
  type: 'line',
  data: {
    labels: ['12:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
    datasets: [
      {
        label: 'Luminosidade',
        data: [5000, 15000, 23000, 23000, 15000, 5000],
        borderWidth: 1,
        backgroundColor: '#3D8F40',
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
  type: 'line',
  data: {
    labels: ['12:00', '13:00', '14:00', '15:00', '16:00', '17:00'],
    datasets: [
      {
        label: 'Luminosidade',
        data: [29, 29.3, 29.2, 29.2, 29.2, 28.6],
        borderWidth: 1,
        backgroundColor: '#3D8F40',
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

Chart.defaults.backgroundColor = '#9BD0F5';