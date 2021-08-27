n_range = 1:50:1000;
eff_GE = [];eff_QR = [];
err_GE=[];err_QR=[];

for n=n_range
    A = randn(n);
    x_exact = ones(n,1);
    b = A*x_exact;
    [Q R]=qr(A);
    
    time1 = 0;time2 = 0;
    tempErrGE=0;tempErrQR=0;
    
    for i=1:20
        tic;
        x = A\b;
        time1 = time1 + toc;
        tempErrGE=tempErrGE+ max(abs(x_exact-x));
        
        tic;
        x = R\(Q'*b);
        time2 = time2 + toc;
        tempErrQR=tempErrQR+ max(abs(x_exact-x));
    end
    err_QR=[err_QR tempErrQR];err_GE=[err_GE tempErrGE];
    eff_QR = [eff_QR time2];eff_GE = [eff_GE time1];
end

figure(1);
gePlot = scatter(n_range, eff_GE);
hold;
qrPlot = scatter(n_range, eff_QR);
legend('Gaussian Elimination','QR Factorization');
xlabel("Data Range");
ylabel("Time");
title("Effiency Comparison");
hold off;

figure(2);
gePlot2 = semilogy(n_range, err_GE);
hold;
qrPlot2 = semilogy(n_range, err_QR);
legend('Gaussian Elimination','QR Factorization');
xlabel("Data Range");
ylabel("Error");
title("Robustness Comparison");
hold off;