document.getElementById('year').textContent = new Date().getFullYear();

document.getElementById('book-now').addEventListener('click', () => {
  window.location.href = 'mailto:weddifyme66@gmail.com?subject=Card%20Design%20Request&body=Hello%20Weddify_Me%2C%20I%27d%20like%20to%20create%20a%20custom%20card.';
});