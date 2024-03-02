function dados = ImportarDados(numFich)
path = "archive\data\44\";
constantPath = "_44_0.wav";
dados = cell(1,numFich);

limiar = 0.1
tamanhoMaximo = 0;

for num = 0:numFich-1
    nomeAudio = strcat(path,num2str(num),constantPath);

    [amplitude,amostras] = audioread(nomeAudio);

    amplitude = amplitude ./ max(abs(amplitude));
    dados{num+1}.amplitude = amplitude;
    dados{num+1}.dadosFreq = amostras;
end