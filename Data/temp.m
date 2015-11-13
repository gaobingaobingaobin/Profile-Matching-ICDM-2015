mapStack = reshape(mapStack,100,100,100);

f1 = figure('color','white');
movieFrames = [];

nFrames = 100;
mov(1:nFrames) = struct('cdata', [],...
                        'colormap', []);

for i = 1:100
    figure(f1);
    subplot(1,2,1);
    imagesc(GT(:,:,i));axis image;title(['Ground Truth at t = ' num2str(i)]);colormap([0 0 0.7;0 0.7 0])
    subplot(1,2,2);
    imagesc(mapStack(:,:,i));axis image;title(['Noisy Input at t = ' num2str(i)]);colormap([0 0 0.7;0 0.7 0])
    pause(0.2)
    mov(i) = getframe(gcf);
end
% Create AVI file.
movie2avi(mov, 'myPeaks.avi', 'compression', 'None','fps',2,'quality',100);