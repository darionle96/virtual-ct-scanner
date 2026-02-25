    P = phantom(256);
    
    % PROJECTION PARALLEL/LINEAR
    thetaX = 0:1:359; 
    [R,xp] = radon(P, thetaX); 
    num_angles_R = size(R, 2) % Angle Steps
    
    % PROJECTION DATA PARALLEL
    imagesc(thetaX, xp, R);
    colormap(hot);
    colorbar;
    xlabel('Parallel Rotation Angle - \theta (degrees)'); 
    ylabel('Parallel Sensor Position - x\prime (pixels)');
    
    % RECONSTRUCTION IMAGE PARALLEL/LINEAR IMAGE
    output_size = max(size(P));
    dthetaX = thetaX(2) - thetaX(1);
    I1 = iradon(R, dthetaX, output_size);
    figure;
    imshow(I1);