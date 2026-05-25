const ctx = document.getElementById('graficoLinha');
const perigo = {
  type: 'box',
  backgroundColor: 'rgba(0, 0, 0)',
  borderWidth: 0,
  yMax: 20,
  yMin: -0.5,
  label: {
    drawTime: 'afterDraw',
    display: true,
    content: 'First quarter',
    position: {
      x: 'start',
      y: 'center'
    }
  }
};
new Chart(ctx, {
  type: 'line',
  data: {
    labels: ['00:00','02:00','04:00','06:00','08:00','10:00','12:00', '14:00', '16:00', '18:00', '20:00', '22:00'],
    datasets: [
      {
        label: 'Luminosidade',
        data: [0, 0, 0, 200, 8000, 20000, 40000, 45000, 25000, 5000, 500, 0],
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
    },
    plugins: {
      annotation: {
        common: {
          drawTime: 'beforeDraw'
        },
        annotations: {
          
        }
      }
    }
  }
});

const ctx2 = document.getElementById('graficoColuna');

new Chart(ctx2, {
  type: 'line',
  data: {
    labels: ['00:00','02:00','04:00','06:00','08:00','10:00','12:00', '14:00', '16:00', '18:00', '20:00', '22:00'],
    datasets: [
      {
        label: 'Temperatura',
        data: [22, 21, 20, 19, 22, 26, 30, 31, 29, 26, 24, 23],
        borderWidth: 1,
        backgroundColor: '#3D8F40',
        borderColor: '#fff',
        tension: 0.5,
      },
    ]
  },
  options: {
    scales: {
      x: {
        title: {
          display: true,
          text: 'Horário',
          color: '#fff'
        },
        ticks: {
          color: '#fff'
        },
        grid: {
          color: '#000'
        }
      },
      y: {
        max: 40,
        min: 0,
        beginAtZero: true,
        title: {
          display: true,
          text: 'Temperatura (°C)',
          color: '#fff'
        },
        ticks: {
          color: '#fff'
        },
        grid: {
          color: '#000'
        }
      }
    },
    plugins: {
      annotation: {
        common: {
          drawTime: 'beforeDraw'
        },
        annotations: {
          perigo
        }
      }
    }
  }
});



