trans = [ 0.9518    0.0240    0.0242;
    0.9107         0    0.0893;
    0.8919    0.1081         0];
em = [1     0     0;
     0     1     0;
     0     0     1];
trans1 = [0.9761    0.0120    0.0120;
    0.8182    0.0455    0.1364;
    1.0000         0         0];

em1 =[  1     0     0;
     0     1     0;
     0     0     1];
trans2 = [0.9576    0.0207    0.0217;
    0.9437         0    0.0563;
    0.9167    0.0833         0];
em2 = [ 1     0     0
     0     1     0
     0     0     1];
TRANS_MATRIX = (trans + trans1 + trans2)/3;
EMMISSION_MATRIX = (em + em1 + em2)/3;

disp(TRANS_MATRIX)
disp('^^^^^^^^^^^^^^^^^^^^^^^')
disp(EMMISSION_MATRIX)


