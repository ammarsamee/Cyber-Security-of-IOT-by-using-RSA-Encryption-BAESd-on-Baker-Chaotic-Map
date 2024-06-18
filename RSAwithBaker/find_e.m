function e = find_e(phi)
    for e = 2:phi
        if gcd(e, phi) == 1
            return;
        end
    end
    error('No suitable value for e found.');
end
