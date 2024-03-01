function dados = ImportarDados(numFich)
path = "archive\data\03\";
constantPath = "_03_0.wav";
dados = cell(1,numFich);

for num = 0:numFich-1
    nomeAudio = strcat(path,num2str(num),constantPath);

    [amplitude,amostras] = audioread(nomeAudio);

    sinalNormalizado = amplitude / max(abs(amplitude));
    dados{num+1}.dadosSinal = sinalNormalizado;
    dados{num+1}.dadosFreq = amostras;
end