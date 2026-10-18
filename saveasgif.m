function saveasgif(img, path, dtime)
% SAVEASGIF saves a 3D matrix as a GIF. Matrix is normalized to [0,255], then exported as a grayscale with 0.25 second long frames
    img = round((((img - min(img,[],'all'))./max(img,[],'all'))+(1/255)).*255);
    for i = 1:size(img,3)
        j = size(img,3)-i+1;
        if i == 1
            imwrite(img(:,:,j), gray, path, 'gif', 'LoopCount', Inf, 'DelayTime', dtime);
        else
            imwrite(img(:,:,j), gray, path, 'gif', 'WriteMode', 'append', 'DelayTime', dtime);
        end
    end
end