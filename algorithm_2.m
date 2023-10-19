function H = algorithm_2(Y, v, e_real, e_imag, v_hist, alpha)
    Y_real = real(Y);
    Y_imag = -imag(Y);
    v_real = real(v);
    v_imag = imag(v);

    [phi_RR, tor_RR] = algorithm_1(Y_real, v_real, e_real, real(v_hist), alpha);
    [phi_RJ, tor_RJ] = algorithm_1(Y_imag, v_real, e_real, real(v_hist), alpha);
    [phi_JJ, tor_JJ] = algorithm_1(Y_imag, v_imag, e_imag, imag(v_hist), alpha);
    [phi_JR, tor_JR] = algorithm_1(Y_real, v_imag, e_imag, imag(v_hist), alpha);

    if (phi_RR > tor_RR) | (phi_JJ > tor_JJ) | (phi_JR > tor_JR) | (phi_RJ > tor_RJ)
        H = 'H_1';
    else
        H = 'H_0';
    end
end