% Function for testing connectivity of Julia sets
% input : function of z corresponding to the Julia set
% output : result of connectedness of the Julia set
result = testConnect(@(z) z^2 + 1); % test Julia set using function call
fprintf(result);


function result = testConnect(phi_z)
result = "Julia set is connected\n";
z = []; %initializing orbit
phi = phi_z; % obtain input funciton of z here
z(1) = 0; % orb(0) means first element is 0 i.e. z_0 = 0
for i = 2:100
    z(i) = phi(z(i-1));
    if z(i) > 100
        result = "Julia set is not connected\n";
        break;
    end
end
end