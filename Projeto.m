path = "C:\Users\joaog\OneDrive\Documentos\MATLAB\44_0\";
files = dir(fullfile(path, '*.wav'));
dados = cell(1,length(files));

limiar = 0.1

tamanhoMaximo = 0;

for num = 1:length(files)
    nomeAudio = files(num).name;
    full_path = fullfile(path, nomeAudio);
    
    [amplitude, freq] = audioread(full_path);

    %Graficos(length(dados), amplitude, num);

    hold on,

    amplitude = amplitude./max(abs(amplitude));

    E = amplitude.^2;
    comeco = find(E > limiar * max(E), 1);
    newAudio = amplitude(comeco:end);

    if length(newAudio) > tamanhoMaximo
        tamanhoMaximo = length(newAudio);
    end

    %Graficos(length(dados), newAudio, num);

    dados{num}.amplitude = amplitude;
    dados{num}.newAudio = newAudio;
    dados{num}.energia = E;
    dados{num}.freq = freq;

end

for num = 1:length(files)
    
    newAudio = dados{num}.newAudio;

    tamanhoSilencio = tamanhoMaximo - length(newAudio);

    if length(newAudio) < tamanhoMaximo
        silencio = zeros(tamanhoSilencio, 1);
        audioComFim = [newAudio;silencio];
    end

    %Graficos(length(dados), audioComFim, num);
   
end

function Graficos(tamanho, amplitude, i)
    numV = 2;
    numH = ceil(tamanho / numV);

    duration = length(amplitude);
    time = linspace(0,duration,length(amplitude));

    subplot(numH,numV,i);
    plot(time,amplitude);

    title(num2str(i));
    xlabel('Tempo (s)');
    ylabel('Amplitude');

    sgtitle('Plots dos Áudios');
end

function Grafico3D(amplitude, energia, newAudio)
    figure;
    surf(amplitude, energia, newAudio);
    xlabel('Amplitude');
    ylabel('Energia');
    zlabel('Taxa de Cruzamentos por Zero');
    title('Superfície 3D de Características de Áudio');
end