numFich = 10
dados = ImportarDados(numFich);
Graficos(dados);

for num = 1:numFich
    amplitude = dados{num}.amplitude;
    E = amplitude.^2;
    comeco = find(E > limiar * max(E), 1);
    amplitude = amplitude(comeco:end);

    if length(amplitude) > tamanhoMaximo
        tamanhoMaximo = length(amplitude);
    end

    dados{num}.energia = E;
    dados{num}.amplitude = amplitude;
end

for num = 1:numFich
    
    newAudio = dados{num}.amplitude;

    tamanhoSilencio = tamanhoMaximo - length(newAudio);

    if length(newAudio) < tamanhoMaximo
        silencio = zeros(tamanhoSilencio, 1);
        audioComFim = [newAudio;silencio];
        dados{num}.amplitude = audioComFim;
    end
   
end

%Graficos(dados);