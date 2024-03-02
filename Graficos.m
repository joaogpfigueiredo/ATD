function Graficos(dados)
    numV = 2;
    numH = ceil(numel(dados) / numV);

    for i = 1:numel(dados)
        noiseCancel(dados{i})
        duration = length(dados{i}.amplitude) / dados{i}.dadosFreq;
        time = linspace(0,duration,length(dados{i}.amplitude));

        subplot(numH,numV,i);
        plot(time,dados{i}.amplitude);

        title(num2str(i-1));
        xlabel('Tempo (s)');
        ylabel('Amplitude');

    sgtitle('Plots dos Áudios');
    end
