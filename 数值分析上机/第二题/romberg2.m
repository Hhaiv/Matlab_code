function result = romberg2(F,a,b,epsilon)
    %% ��ʼ��ֵ
    e = inf;
    xk = [a,b];% 
    T = [];  % �������ι�ʽ
    S = [];  % ����Simpson��ʽ
    C = [];  % ����Cotes��ʽ
    R = [];  % Romberg��ʽ
    k = 1;   % ��ǰ����

    %% ����
    digits(10)
    h = b - a;
    T1 = vpa( h / 2 * ( F(a) + F(b) ) );
    T = [T,T1];
    
    while(e>epsilon)
        xk2= [];
        for i=1:length(xk)-1
            xk2 = [xk2, (xk(i) + xk(i+1)) / 2];
        end

        % ����Tn
        sum = 0;
        for i=1:length(xk2)
            sum = vpa(sum + h * F(xk2(i)));
        end
        T_temp = 0.5 * ( T(end) + sum);
        T = [T,T_temp];
        k = k + 1;
        h = h / 2;
        xk = [xk, xk2];
        xk = sort(xk);

        % ����Sn
        if k>=2
            S_temp = 4 / 3 * T(end) - 1 / 3 * T(end-1);
            S = [S, S_temp];
        end

        % ����Cn
        if k>=3
            C_temp = 16 / 15 * S(end) - 1 / 15 * S(end-1);
            C = [C, C_temp];

        end

        % ����Rn
        if k>=4
            R_temp = 64 / 63 * C(end) - 1 / 63 * C(end-1);
            R = [R, R_temp];

        end

        % �������e
        if k>=5
            e = abs(R(end) -  R(end-1));

        end

    end

    result = R(end);
end
