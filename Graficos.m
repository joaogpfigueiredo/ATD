function Graficos(dados)
    numV = 2;
    numH = ceil(numel(dados) / numV);

    for i = 1:numel(dados)
        noiseCancel(dados{i})
        duration = length(dados{i}.dadosSinal) / dados{i}.dadosFreq;
        time = linspace(0,duration,length(dados{i}.dadosSinal));

        subplot(numH,numV,i);
        plot(time,dados{i}.dadosSinal);

        title(num2str(i));
        xlabel('Tempo (s)');
        ylabel('Amplitude');

    sgtitle('Plots dos Áudios');
    end
