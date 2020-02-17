function [xss, yss] = julia(iterations,left,right,bottom,top,points,c)
    psi_plus = @(z,c) sqrt(z-c);
    psi_minus = @(z,c) -sqrt(z-c);
    colormap([1 0 0; 1 1 1]);

    xss = zeros(1,points);
    yss = zeros(1,points);

    oldCompletion = 0;
    lineLength = displayCompletion(oldCompletion, 0);
    for j=1:points,
        y = rand()*(top-bottom)+bottom;
        x = rand()*(right-left)+left;
        z = x + 1i*y;
        zk = z;
        kount = 0;

        while kount < iterations && abs(zk) < sqrt((top - bottom)^2 + (right - left)^2),
            kount = kount + 1;
            if(rand()>0.5),
                zk = psi_plus(zk,c);
            else,
                zk = psi_minus(zk,c);
            end;
        end;
        xss(j)= real(zk);
        yss(j) = imag(zk);
        completion = round((j/points)*100);
        if (completion ~= oldCompletion),
            lineLength = displayCompletion(completion, lineLength);
            oldCompletion = completion;
        end;
    end;
    fprintf("\nDone\n");
end
