<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Gerador de Links - Tour Virtual 360°</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
      background: #f4f4f4;
    }
    h1 {
      color: #333;
    }
    label {
      display: block;
      margin-top: 10px;
    }
    input, textarea, button {
      width: 100%;
      padding: 8px;
      margin-top: 5px;
      box-sizing: border-box;
    }
    button {
      background-color: #3498db;
      color: white;
      border: none;
      cursor: pointer;
      margin-top: 15px;
    }
    button:hover {
      background-color: #2980b9;
    }
    #linkFinal {
      margin-top: 20px;
      background: #fff;
      padding: 10px;
      border: 1px solid #ccc;
      word-break: break-all;
    }
  </style>
</head>
<body>

<h1>Gerador de Link - Tour 360°</h1>

<label for="imagens">URLs das Imagens (uma por linha):</label>
<textarea id="imagens" rows="5" placeholder="Cole as URLs aqui..."></textarea>

<label for="codigo">Código do Imóvel:</label>
<input type="text" id="codigo" placeholder="Ex: AP-2345">

<button onclick="gerarLink()">Gerar Link</button>

<div id="linkFinal"></div>

<script>
function gerarLink() {
  const imagensTexto = document.getElementById('imagens').value.trim();
  const codigo = document.getElementById('codigo').value.trim();

  if (!imagensTexto || !codigo) {
    alert('Preencha as imagens e o código do imóvel.');
    return;
  }

  const imagensArray = imagensTexto.split('\n').map(url => url.trim()).filter(url => url !== '');

  const dados = {
    files: imagensArray,
    codigo: codigo
  };

  const dadosJson = JSON.stringify(dados);
  const dadosBase64 = btoa(dadosJson);

  const link = `http://localhost/tour360/?data=${dadosBase64}`;

  document.getElementById('linkFinal').innerHTML = `<strong>Link Gerado:</strong><br><a href="${link}" target="_blank">${link}</a>`;
}
</script>

</body>
</html>
