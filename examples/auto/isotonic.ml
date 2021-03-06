(* spearmanr *)
(*
>>> from scipy import stats
>>> stats.spearmanr([1,2,3,4,5], [5,6,7,8,7])
(0.82078268166812329, 0.088587005313543798)
>>> np.random.seed(1234321)
>>> x2n = np.random.randn(100, 2)
>>> y2n = np.random.randn(100, 2)
>>> stats.spearmanr(x2n)
(0.059969996999699973, 0.55338590803773591)
>>> stats.spearmanr(x2n[:,0], x2n[:,1])
(0.059969996999699973, 0.55338590803773591)
>>> rho, pval = stats.spearmanr(x2n, y2n)
>>> rho
array([[ 1.        ,  0.05997   ,  0.18569457,  0.06258626],
       [ 0.05997   ,  1.        ,  0.110003  ,  0.02534653],
       [ 0.18569457,  0.110003  ,  1.        ,  0.03488749],
       [ 0.06258626,  0.02534653,  0.03488749,  1.        ]])
>>> pval
array([[ 0.        ,  0.55338591,  0.06435364,  0.53617935],
       [ 0.55338591,  0.        ,  0.27592895,  0.80234077],
       [ 0.06435364,  0.27592895,  0.        ,  0.73039992],
       [ 0.53617935,  0.80234077,  0.73039992,  0.        ]])
>>> rho, pval = stats.spearmanr(x2n.T, y2n.T, axis=1)
>>> rho
array([[ 1.        ,  0.05997   ,  0.18569457,  0.06258626],
       [ 0.05997   ,  1.        ,  0.110003  ,  0.02534653],
       [ 0.18569457,  0.110003  ,  1.        ,  0.03488749],
       [ 0.06258626,  0.02534653,  0.03488749,  1.        ]])
>>> stats.spearmanr(x2n, y2n, axis=None)
(0.10816770419260482, 0.1273562188027364)
>>> stats.spearmanr(x2n.ravel(), y2n.ravel())
(0.10816770419260482, 0.1273562188027364)


*)

(* TEST TODO
let%expect_text "spearmanr" =
    let stats = Scipy.stats in
    print @@ spearmanr stats [1 2 3 4 5] [5 6 7 8 7]
    [%expect {|
            (0.82078268166812329, 0.088587005313543798)            
    |}]
    np.random.seed(1234321)    
    x2n = np.random.randn(100, 2)    
    y2n = np.random.randn(100, 2)    
    print @@ spearmanr stats x2n
    [%expect {|
            (0.059969996999699973, 0.55338590803773591)            
    |}]
    print @@ spearmanr stats x2n[: 0] x2n[: 1]
    [%expect {|
            (0.059969996999699973, 0.55338590803773591)            
    |}]
    rho, pval = stats.spearmanr(x2n, y2n)    
    rho    
    [%expect {|
            array([[ 1.        ,  0.05997   ,  0.18569457,  0.06258626],            
                   [ 0.05997   ,  1.        ,  0.110003  ,  0.02534653],            
                   [ 0.18569457,  0.110003  ,  1.        ,  0.03488749],            
                   [ 0.06258626,  0.02534653,  0.03488749,  1.        ]])            
    |}]
    pval    
    [%expect {|
            array([[ 0.        ,  0.55338591,  0.06435364,  0.53617935],            
                   [ 0.55338591,  0.        ,  0.27592895,  0.80234077],            
                   [ 0.06435364,  0.27592895,  0.        ,  0.73039992],            
                   [ 0.53617935,  0.80234077,  0.73039992,  0.        ]])            
    |}]
    rho, pval = stats.spearmanr(x2n.T, y2n.T, axis=1)    
    rho    
    [%expect {|
            array([[ 1.        ,  0.05997   ,  0.18569457,  0.06258626],            
                   [ 0.05997   ,  1.        ,  0.110003  ,  0.02534653],            
                   [ 0.18569457,  0.110003  ,  1.        ,  0.03488749],            
                   [ 0.06258626,  0.02534653,  0.03488749,  1.        ]])            
    |}]
    print @@ spearmanr stats x2n y2n axis=None
    [%expect {|
            (0.10816770419260482, 0.1273562188027364)            
    |}]
    stats.spearmanr(x2n.ravel(), y2n.ravel())    
    [%expect {|
            (0.10816770419260482, 0.1273562188027364)            
    |}]

*)



