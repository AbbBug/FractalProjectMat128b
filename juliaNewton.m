%colored representation of convergence to polynomial roots using
%Newton's Method on the complex plane
%required for the running of question7.m
%darkest color corresponds to first root
%lighter colors correspond to other roots down the vector of roots
function M = juliaNewton(iterations,left,right,bottom,top,xRes,yRes,n)
    colormap default
    phi_z = @(z) z^n - 1; 
    phi_p = @(z) n*z^(n-1);
    poly = zeros(1,n+1);
    poly(end) = -1;
    poly(1) = 1;
    r = roots(poly);    
    M = 1*ones(yRes,xRes); %darkest color given by 1
    oldCompletion = 0;
    lineLength = displayCompletion(oldCompletion, 0);
    for j=1:yRes
        y = bottom + (j-1)*(top - bottom)/yRes;
        for i=1:xRes
            x = left + (i-1)*(right - left)/xRes;
            z = x + 1i*y;
            zk = z;
            for k = 1:iterations
                for m = 1:length(r)
                    if abs(zk - r(m)) < 10^(-6)
                        M(j,i) = 1+5*m; 
                        %color gets lighter as root gets
                        %closer to the end
                    end
                end
                zk = zk - phi_z(zk)/phi_p(zk);
            end
            completion = round(((j-1)/yRes+i/(xRes*yRes))*100);
            if (completion ~= oldCompletion)
                lineLength = displayCompletion(completion, lineLength);
                oldCompletion = completion;
            end
        end
    end
    fprintf("\nDone\n");
end
