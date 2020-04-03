(* KNeighborsClassifier *)
(*
>>> X = [[0], [1], [2], [3]]
>>> y = [0, 0, 1, 1]
>>> from sklearn.neighbors import KNeighborsClassifier
>>> neigh = KNeighborsClassifier(n_neighbors=3)
>>> neigh.fit(X, y)
KNeighborsClassifier(...)
>>> print(neigh.predict([[1.1]]))
[0]
>>> print(neigh.predict_proba([[0.9]]))
[[0.66666667 0.33333333]]


*)

let print f x = Format.printf "%a" f x
let print_py x = Format.printf "%s" (Py.Object.to_string x)
let print_ndarray = print Sklearn.Ndarray.pp
module Matrix = Owl.Dense.Matrix.D
let matrix mat = Matrix.of_arrays mat;;
let vector vec = Owl.Arr.of_array vec [|Array.length vec|];;

let%expect_test "KNeighborsClassifier" =
    let x = matrix [|[|0.|]; [|1.|]; [|2.|]; [|3.|]|] in
    let y = vector [|0.; 0.; 1.; 1.|] in
    let open Sklearn.Neighbors in
    let neigh = KNeighborsClassifier.create ~n_neighbors:3 () in
    print KNeighborsClassifier.pp @@ KNeighborsClassifier.fit neigh ~x:(`Ndarray x) ~y:(`Ndarray y);
    [%expect {|
            KNeighborsClassifier(algorithm='auto', leaf_size=30, metric='minkowski',
                                 metric_params=None, n_jobs=None, n_neighbors=3, p=2,
                                 weights='uniform')
    |}];
    print_ndarray @@ KNeighborsClassifier.predict neigh ~x:(matrix [|[|1.1|]|]);
    [%expect {|
            [0.]
    |}];
    print_ndarray @@ KNeighborsClassifier.predict_proba neigh ~x:(matrix [|[|0.9|]|]);
    [%expect {|
            [[0.66666667 0.33333333]]            
    |}]


(* kneighbors *)
(*
>>> samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(n_neighbors=1)
>>> neigh.fit(samples)
NearestNeighbors(n_neighbors=1)
>>> print(neigh.kneighbors([[1., 1., 1.]]))
(array([[0.5]]), array([[2]]))


*)

let%expect_test "KNeighborsMixin.kneighbors" =
  let samples = matrix [|[|0.; 0.; 0.|]; [|0.; 0.5; 0.|]; [|1.; 1.; 0.5|]|] in
  let open Sklearn.Neighbors in
  let neigh = NearestNeighbors.create ~n_neighbors:1 () in
  print NearestNeighbors.pp @@ NearestNeighbors.fit neigh ~x:(`Ndarray samples) ();
  [%expect {|
            NearestNeighbors(algorithm='auto', leaf_size=30, metric='minkowski',
                             metric_params=None, n_jobs=None, n_neighbors=1, p=2,
                             radius=1.0)
    |}];
  let neigh_dist, neigh_ind = NearestNeighbors.kneighbors neigh ~x:(matrix [|[|1.; 1.; 1.|]|]) () in
  Format.printf "(%a, %a)" Sklearn.Ndarray.pp neigh_dist Sklearn.Ndarrayi.pp neigh_ind;
  [%expect {|
            ([[0.5]], [[2]])
    |}]


(* kneighbors_graph *)
(*
>>> X = [[0], [3], [1]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(n_neighbors=2)
>>> neigh.fit(X)
NearestNeighbors(n_neighbors=2)
>>> A = neigh.kneighbors_graph(X)
>>> A.toarray()
array([[1., 0., 1.],
       [0., 1., 1.],
       [1., 0., 1.]])


*)

let%expect_test "KNeighborsMixin.kneighbors_graph" =
  let x = matrix [|[|0.|]; [|3.|]; [|1.|]|] in
  let open Sklearn.Neighbors in
  let neigh = NearestNeighbors.create ~n_neighbors:2 () in
  print NearestNeighbors.pp @@ NearestNeighbors.fit neigh ~x:(`Ndarray x) ();
  [%expect {|
            NearestNeighbors(algorithm='auto', leaf_size=30, metric='minkowski',
                             metric_params=None, n_jobs=None, n_neighbors=2, p=2,
                             radius=1.0)
    |}];
  let a = NearestNeighbors.kneighbors_graph neigh ~x () in
  print_ndarray @@ Sklearn.Csr_matrix.toarray a ();
  [%expect {|
            [[1. 0. 1.]
             [0. 1. 1.]
             [1. 0. 1.]]
    |}]



(* KNeighborsRegressor *)
(*
>>> X = [[0], [1], [2], [3]]
>>> y = [0, 0, 1, 1]
>>> from sklearn.neighbors import KNeighborsRegressor
>>> neigh = KNeighborsRegressor(n_neighbors=2)
>>> neigh.fit(X, y)
KNeighborsRegressor(...)
>>> print(neigh.predict([[1.5]]))
[0.5]


*)

let%expect_test "KNeighborsRegressor" =
    let x = matrix [|[|0.|]; [|1.|]; [|2.|]; [|3.|]|] in
    let y = vector [|0.; 0.; 1.; 1.|] in
    let open Sklearn.Neighbors in
    let neigh = KNeighborsRegressor.create ~n_neighbors:2 () in 
    print KNeighborsRegressor.pp @@ KNeighborsRegressor.fit neigh ~x:(`Ndarray x) ~y:(`Ndarray y);
    [%expect {|
            KNeighborsRegressor(algorithm='auto', leaf_size=30, metric='minkowski',
                                metric_params=None, n_jobs=None, n_neighbors=2, p=2,
                                weights='uniform')
    |}];
    print_ndarray @@ KNeighborsRegressor.predict neigh ~x:(matrix [|[|1.5|]|]);
    [%expect {|
            [0.5]            
    |}]

(* kneighbors *)
(*
>>> samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(n_neighbors=1)
>>> neigh.fit(samples)
NearestNeighbors(n_neighbors=1)
>>> print(neigh.kneighbors([[1., 1., 1.]]))
(array([[0.5]]), array([[2]]))


*)

let%expect_test "KNeighborsMixin.kneighbors" =
  let samples = matrix [|[|0.; 0.; 0.|]; [|0.; 0.5; 0.|]; [|1.; 1.; 0.5|]|] in
  let open Sklearn.Neighbors in
  let neigh = NearestNeighbors.create ~n_neighbors:1 () in
  print NearestNeighbors.pp @@ NearestNeighbors.fit neigh ~x:(`Ndarray samples) ();
  [%expect {|
            NearestNeighbors(algorithm='auto', leaf_size=30, metric='minkowski',
                             metric_params=None, n_jobs=None, n_neighbors=1, p=2,
                             radius=1.0)
    |}];
  let dist, ind = NearestNeighbors.kneighbors neigh ~x:(matrix [|[|1.; 1.; 1.|]|]) () in
  Format.printf "(%a, %a)" Sklearn.Ndarray.pp dist Sklearn.Ndarrayi.pp ind;
  [%expect {|
            ([[0.5]], [[2]])
    |}]


(* kneighbors_graph *)
(*
>>> X = [[0], [3], [1]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(n_neighbors=2)
>>> neigh.fit(X)
NearestNeighbors(n_neighbors=2)
>>> A = neigh.kneighbors_graph(X)
>>> A.toarray()
array([[1., 0., 1.],
       [0., 1., 1.],
       [1., 0., 1.]])


*)

let%expect_test "KNeighborsMixin.kneighbors_graph" =
    let x = matrix [|[|0.|]; [|3.|]; [|1.|]|] in
    let open Sklearn.Neighbors in
    let neigh = NearestNeighbors.create ~n_neighbors:2 () in
    print NearestNeighbors.pp @@ NearestNeighbors.fit neigh ~x:(`Ndarray x) ();
    [%expect {|
            NearestNeighbors(algorithm='auto', leaf_size=30, metric='minkowski',
                             metric_params=None, n_jobs=None, n_neighbors=2, p=2,
                             radius=1.0)
    |}];
    let a = NearestNeighbors.kneighbors_graph neigh ~x () in
    print_ndarray @@ Sklearn.Csr_matrix.toarray a ();
    [%expect {|
            [[1. 0. 1.]
             [0. 1. 1.]
             [1. 0. 1.]]
    |}]


(* kneighbors *)
(*
>>> samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(n_neighbors=1)
>>> neigh.fit(samples)
NearestNeighbors(n_neighbors=1)
>>> print(neigh.kneighbors([[1., 1., 1.]]))
(array([[0.5]]), array([[2]]))


*)

let%expect_test "KNeighborsMixin.kneighbors" =
    let samples = matrix [|[|0.; 0.; 0.|]; [|0.; 0.5; 0.|]; [|1.; 1.; 0.5|]|] in
    let open Sklearn.Neighbors in
    let neigh = NearestNeighbors.create ~n_neighbors:1 () in
    print NearestNeighbors.pp @@ NearestNeighbors.fit neigh ~x:(`Ndarray samples) ();
    [%expect {|
            NearestNeighbors(algorithm='auto', leaf_size=30, metric='minkowski',
                             metric_params=None, n_jobs=None, n_neighbors=1, p=2,
                             radius=1.0)
    |}];
    let dist, ind = NearestNeighbors.kneighbors neigh ~x:(matrix [|[|1.; 1.; 1.|]|]) () in
    Format.printf "(%a, %a)" Sklearn.Ndarray.pp dist Sklearn.Ndarrayi.pp ind;
    [%expect {|
            ([[0.5]], [[2]])
    |}]

(* kneighbors_graph *)
(*
>>> X = [[0], [3], [1]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(n_neighbors=2)
>>> neigh.fit(X)
NearestNeighbors(n_neighbors=2)
>>> A = neigh.kneighbors_graph(X)
>>> A.toarray()
array([[1., 0., 1.],
       [0., 1., 1.],
       [1., 0., 1.]])


*)

let%expect_test "KNeighborsMixin.kneighbors_graph" =
    let x = matrix [|[|0.|]; [|3.|]; [|1.|]|] in
    let open Sklearn.Neighbors in
    let neigh = NearestNeighbors.create ~n_neighbors:2 () in
    print NearestNeighbors.pp @@ NearestNeighbors.fit neigh ~x:(`Ndarray x) ();
    [%expect {|
            NearestNeighbors(algorithm='auto', leaf_size=30, metric='minkowski',
                             metric_params=None, n_jobs=None, n_neighbors=2, p=2,
                             radius=1.0)
    |}];
    let a = NearestNeighbors.kneighbors_graph neigh ~x () in
    print_ndarray @@ Sklearn.Csr_matrix.toarray a ();
    [%expect {|
            [[1. 0. 1.]
             [0. 1. 1.]
             [1. 0. 1.]]
    |}]


(* LocalOutlierFactor *)
(*
>>> import numpy as np
>>> from sklearn.neighbors import LocalOutlierFactor
>>> X = [[-1.1], [0.2], [101.1], [0.3]]
>>> clf = LocalOutlierFactor(n_neighbors=2)
>>> clf.fit_predict(X)
array([ 1,  1, -1,  1])
>>> clf.negative_outlier_factor_
array([ -0.9821...,  -1.0370..., -73.3697...,  -0.9821...])


*)

(* TEST TODO
let%expect_test "LocalOutlierFactor" =
    import numpy as np    
    let localOutlierFactor = Sklearn.Neighbors.localOutlierFactor in
    X = [[-1.1], [0.2], [101.1], [0.3]]    
    clf = LocalOutlierFactor(n_neighbors=2)    
    print @@ fit_predict clf x
    [%expect {|
            array([ 1,  1, -1,  1])            
    |}]
    clf.negative_outlier_factor_    
    [%expect {|
            array([ -0.9821...,  -1.0370..., -73.3697...,  -0.9821...])            
    |}]

*)



(* kneighbors *)
(*
>>> samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(n_neighbors=1)
>>> neigh.fit(samples)
NearestNeighbors(n_neighbors=1)
>>> print(neigh.kneighbors([[1., 1., 1.]]))
(array([[0.5]]), array([[2]]))


*)

(* TEST TODO
let%expect_test "KNeighborsMixin.kneighbors" =
    samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]    
    let nearestNeighbors = Sklearn.Neighbors.nearestNeighbors in
    neigh = NearestNeighbors(n_neighbors=1)    
    print @@ fit neigh samples
    [%expect {|
            NearestNeighbors(n_neighbors=1)            
    |}]
    print(neigh.kneighbors([[1., 1., 1.]]))    
    [%expect {|
            (array([[0.5]]), array([[2]]))            
    |}]

*)



(* kneighbors_graph *)
(*
>>> X = [[0], [3], [1]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(n_neighbors=2)
>>> neigh.fit(X)
NearestNeighbors(n_neighbors=2)
>>> A = neigh.kneighbors_graph(X)
>>> A.toarray()
array([[1., 0., 1.],
       [0., 1., 1.],
       [1., 0., 1.]])


*)

(* TEST TODO
let%expect_test "KNeighborsMixin.kneighbors_graph" =
    X = [[0], [3], [1]]    
    let nearestNeighbors = Sklearn.Neighbors.nearestNeighbors in
    neigh = NearestNeighbors(n_neighbors=2)    
    print @@ fit neigh x
    [%expect {|
            NearestNeighbors(n_neighbors=2)            
    |}]
    A = neigh.kneighbors_graph(X)    
    A.toarray()    
    [%expect {|
            array([[1., 0., 1.],            
                   [0., 1., 1.],            
                   [1., 0., 1.]])            
    |}]

*)



(* NearestCentroid *)
(*
>>> from sklearn.neighbors import NearestCentroid
>>> import numpy as np
>>> X = np.array([[-1, -1], [-2, -1], [-3, -2], [1, 1], [2, 1], [3, 2]])
>>> y = np.array([1, 1, 1, 2, 2, 2])
>>> clf = NearestCentroid()
>>> clf.fit(X, y)
NearestCentroid()
>>> print(clf.predict([[-0.8, -1]]))
[1]


*)

(* TEST TODO
let%expect_test "NearestCentroid" =
    let nearestCentroid = Sklearn.Neighbors.nearestCentroid in
    import numpy as np    
    X = np.array([[-1, -1], [-2, -1], [-3, -2], [1, 1], [2, 1], [3, 2]])    
    y = np.array([1, 1, 1, 2, 2, 2])    
    clf = NearestCentroid()    
    print @@ fit clf x y
    [%expect {|
            NearestCentroid()            
    |}]
    print(clf.predict([[-0.8, -1]]))    
    [%expect {|
            [1]            
    |}]

*)



(* kneighbors *)
(*
>>> samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(n_neighbors=1)
>>> neigh.fit(samples)
NearestNeighbors(n_neighbors=1)
>>> print(neigh.kneighbors([[1., 1., 1.]]))
(array([[0.5]]), array([[2]]))


*)

(* TEST TODO
let%expect_test "KNeighborsMixin.kneighbors" =
    samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]    
    let nearestNeighbors = Sklearn.Neighbors.nearestNeighbors in
    neigh = NearestNeighbors(n_neighbors=1)    
    print @@ fit neigh samples
    [%expect {|
            NearestNeighbors(n_neighbors=1)            
    |}]
    print(neigh.kneighbors([[1., 1., 1.]]))    
    [%expect {|
            (array([[0.5]]), array([[2]]))            
    |}]

*)



(* kneighbors_graph *)
(*
>>> X = [[0], [3], [1]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(n_neighbors=2)
>>> neigh.fit(X)
NearestNeighbors(n_neighbors=2)
>>> A = neigh.kneighbors_graph(X)
>>> A.toarray()
array([[1., 0., 1.],
       [0., 1., 1.],
       [1., 0., 1.]])


*)

(* TEST TODO
let%expect_test "KNeighborsMixin.kneighbors_graph" =
    X = [[0], [3], [1]]    
    let nearestNeighbors = Sklearn.Neighbors.nearestNeighbors in
    neigh = NearestNeighbors(n_neighbors=2)    
    print @@ fit neigh x
    [%expect {|
            NearestNeighbors(n_neighbors=2)            
    |}]
    A = neigh.kneighbors_graph(X)    
    A.toarray()    
    [%expect {|
            array([[1., 0., 1.],            
                   [0., 1., 1.],            
                   [1., 0., 1.]])            
    |}]

*)



(* radius_neighbors *)
(*
>>> import numpy as np
>>> samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(radius=1.6)
>>> neigh.fit(samples)
NearestNeighbors(radius=1.6)
>>> rng = neigh.radius_neighbors([[1., 1., 1.]])
>>> print(np.asarray(rng[0][0]))
[1.5 0.5]
>>> print(np.asarray(rng[1][0]))
[1 2]


*)

(* TEST TODO
let%expect_test "RadiusNeighborsMixin.radius_neighbors" =
    import numpy as np    
    samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]    
    let nearestNeighbors = Sklearn.Neighbors.nearestNeighbors in
    neigh = NearestNeighbors(radius=1.6)    
    print @@ fit neigh samples
    [%expect {|
            NearestNeighbors(radius=1.6)            
    |}]
    rng = neigh.radius_neighbors([[1., 1., 1.]])    
    print(np.asarray(rng[0][0]))    
    [%expect {|
            [1.5 0.5]            
    |}]
    print(np.asarray(rng[1][0]))    
    [%expect {|
            [1 2]            
    |}]

*)



(* radius_neighbors_graph *)
(*
>>> X = [[0], [3], [1]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(radius=1.5)
>>> neigh.fit(X)
NearestNeighbors(radius=1.5)
>>> A = neigh.radius_neighbors_graph(X)
>>> A.toarray()
array([[1., 0., 1.],
       [0., 1., 0.],
       [1., 0., 1.]])


*)

(* TEST TODO
let%expect_test "RadiusNeighborsMixin.radius_neighbors_graph" =
    X = [[0], [3], [1]]    
    let nearestNeighbors = Sklearn.Neighbors.nearestNeighbors in
    neigh = NearestNeighbors(radius=1.5)    
    print @@ fit neigh x
    [%expect {|
            NearestNeighbors(radius=1.5)            
    |}]
    A = neigh.radius_neighbors_graph(X)    
    A.toarray()    
    [%expect {|
            array([[1., 0., 1.],            
                   [0., 1., 0.],            
                   [1., 0., 1.]])            
    |}]

*)



(* NeighborhoodComponentsAnalysis *)
(*
>>> from sklearn.neighbors import NeighborhoodComponentsAnalysis
>>> from sklearn.neighbors import KNeighborsClassifier
>>> from sklearn.datasets import load_iris
>>> from sklearn.model_selection import train_test_split
>>> X, y = load_iris(return_X_y=True)
>>> X_train, X_test, y_train, y_test = train_test_split(X, y,
... stratify=y, test_size=0.7, random_state=42)
>>> nca = NeighborhoodComponentsAnalysis(random_state=42)
>>> nca.fit(X_train, y_train)
NeighborhoodComponentsAnalysis(...)
>>> knn = KNeighborsClassifier(n_neighbors=3)
>>> knn.fit(X_train, y_train)
KNeighborsClassifier(...)
>>> print(knn.score(X_test, y_test))
0.933333...
>>> knn.fit(nca.transform(X_train), y_train)
KNeighborsClassifier(...)
>>> print(knn.score(nca.transform(X_test), y_test))
0.961904...


*)

(* TEST TODO
let%expect_test "NeighborhoodComponentsAnalysis" =
    let neighborhoodComponentsAnalysis = Sklearn.Neighbors.neighborhoodComponentsAnalysis in
    let kNeighborsClassifier = Sklearn.Neighbors.kNeighborsClassifier in
    let load_iris = Sklearn.Datasets.load_iris in
    let train_test_split = Sklearn.Model_selection.train_test_split in
    let x, y = load_iris return_X_y=True in
    let n, y_test = train_test_split x y stratify=y test_size=0.7 random_state=42 in
    nca = NeighborhoodComponentsAnalysis(random_state=42)    
    print @@ fit nca x_train y_train
    [%expect {|
            NeighborhoodComponentsAnalysis(...)            
    |}]
    knn = KNeighborsClassifier(n_neighbors=3)    
    print @@ fit knn x_train y_train
    [%expect {|
            KNeighborsClassifier(...)            
    |}]
    print(knn.score(X_test, y_test))    
    [%expect {|
            0.933333...            
    |}]
    knn.fit(nca.transform(X_train), y_train)    
    [%expect {|
            KNeighborsClassifier(...)            
    |}]
    print(knn.score(nca.transform(X_test), y_test))    
    [%expect {|
            0.961904...            
    |}]

*)



(* RadiusNeighborsClassifier *)
(*
>>> X = [[0], [1], [2], [3]]
>>> y = [0, 0, 1, 1]
>>> from sklearn.neighbors import RadiusNeighborsClassifier
>>> neigh = RadiusNeighborsClassifier(radius=1.0)
>>> neigh.fit(X, y)
RadiusNeighborsClassifier(...)
>>> print(neigh.predict([[1.5]]))
[0]
>>> print(neigh.predict_proba([[1.0]]))
[[0.66666667 0.33333333]]


*)

(* TEST TODO
let%expect_test "RadiusNeighborsClassifier" =
    X = [[0], [1], [2], [3]]    
    y = [0, 0, 1, 1]    
    let radiusNeighborsClassifier = Sklearn.Neighbors.radiusNeighborsClassifier in
    neigh = RadiusNeighborsClassifier(radius=1.0)    
    print @@ fit neigh x y
    [%expect {|
            RadiusNeighborsClassifier(...)            
    |}]
    print(neigh.predict([[1.5]]))    
    [%expect {|
            [0]            
    |}]
    print(neigh.predict_proba([[1.0]]))    
    [%expect {|
            [[0.66666667 0.33333333]]            
    |}]

*)



(* radius_neighbors *)
(*
>>> import numpy as np
>>> samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(radius=1.6)
>>> neigh.fit(samples)
NearestNeighbors(radius=1.6)
>>> rng = neigh.radius_neighbors([[1., 1., 1.]])
>>> print(np.asarray(rng[0][0]))
[1.5 0.5]
>>> print(np.asarray(rng[1][0]))
[1 2]


*)

(* TEST TODO
let%expect_test "RadiusNeighborsMixin.radius_neighbors" =
    import numpy as np    
    samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]    
    let nearestNeighbors = Sklearn.Neighbors.nearestNeighbors in
    neigh = NearestNeighbors(radius=1.6)    
    print @@ fit neigh samples
    [%expect {|
            NearestNeighbors(radius=1.6)            
    |}]
    rng = neigh.radius_neighbors([[1., 1., 1.]])    
    print(np.asarray(rng[0][0]))    
    [%expect {|
            [1.5 0.5]            
    |}]
    print(np.asarray(rng[1][0]))    
    [%expect {|
            [1 2]            
    |}]

*)



(* radius_neighbors_graph *)
(*
>>> X = [[0], [3], [1]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(radius=1.5)
>>> neigh.fit(X)
NearestNeighbors(radius=1.5)
>>> A = neigh.radius_neighbors_graph(X)
>>> A.toarray()
array([[1., 0., 1.],
       [0., 1., 0.],
       [1., 0., 1.]])


*)

(* TEST TODO
let%expect_test "RadiusNeighborsMixin.radius_neighbors_graph" =
    X = [[0], [3], [1]]    
    let nearestNeighbors = Sklearn.Neighbors.nearestNeighbors in
    neigh = NearestNeighbors(radius=1.5)    
    print @@ fit neigh x
    [%expect {|
            NearestNeighbors(radius=1.5)            
    |}]
    A = neigh.radius_neighbors_graph(X)    
    A.toarray()    
    [%expect {|
            array([[1., 0., 1.],            
                   [0., 1., 0.],            
                   [1., 0., 1.]])            
    |}]

*)



(* RadiusNeighborsRegressor *)
(*
>>> X = [[0], [1], [2], [3]]
>>> y = [0, 0, 1, 1]
>>> from sklearn.neighbors import RadiusNeighborsRegressor
>>> neigh = RadiusNeighborsRegressor(radius=1.0)
>>> neigh.fit(X, y)
RadiusNeighborsRegressor(...)
>>> print(neigh.predict([[1.5]]))
[0.5]


*)

(* TEST TODO
let%expect_test "RadiusNeighborsRegressor" =
    X = [[0], [1], [2], [3]]    
    y = [0, 0, 1, 1]    
    let radiusNeighborsRegressor = Sklearn.Neighbors.radiusNeighborsRegressor in
    neigh = RadiusNeighborsRegressor(radius=1.0)    
    print @@ fit neigh x y
    [%expect {|
            RadiusNeighborsRegressor(...)            
    |}]
    print(neigh.predict([[1.5]]))    
    [%expect {|
            [0.5]            
    |}]

*)



(* radius_neighbors *)
(*
>>> import numpy as np
>>> samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(radius=1.6)
>>> neigh.fit(samples)
NearestNeighbors(radius=1.6)
>>> rng = neigh.radius_neighbors([[1., 1., 1.]])
>>> print(np.asarray(rng[0][0]))
[1.5 0.5]
>>> print(np.asarray(rng[1][0]))
[1 2]


*)

(* TEST TODO
let%expect_test "RadiusNeighborsMixin.radius_neighbors" =
    import numpy as np    
    samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]    
    let nearestNeighbors = Sklearn.Neighbors.nearestNeighbors in
    neigh = NearestNeighbors(radius=1.6)    
    print @@ fit neigh samples
    [%expect {|
            NearestNeighbors(radius=1.6)            
    |}]
    rng = neigh.radius_neighbors([[1., 1., 1.]])    
    print(np.asarray(rng[0][0]))    
    [%expect {|
            [1.5 0.5]            
    |}]
    print(np.asarray(rng[1][0]))    
    [%expect {|
            [1 2]            
    |}]

*)



(* radius_neighbors_graph *)
(*
>>> X = [[0], [3], [1]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(radius=1.5)
>>> neigh.fit(X)
NearestNeighbors(radius=1.5)
>>> A = neigh.radius_neighbors_graph(X)
>>> A.toarray()
array([[1., 0., 1.],
       [0., 1., 0.],
       [1., 0., 1.]])


*)

(* TEST TODO
let%expect_test "RadiusNeighborsMixin.radius_neighbors_graph" =
    X = [[0], [3], [1]]    
    let nearestNeighbors = Sklearn.Neighbors.nearestNeighbors in
    neigh = NearestNeighbors(radius=1.5)    
    print @@ fit neigh x
    [%expect {|
            NearestNeighbors(radius=1.5)            
    |}]
    A = neigh.radius_neighbors_graph(X)    
    A.toarray()    
    [%expect {|
            array([[1., 0., 1.],            
                   [0., 1., 0.],            
                   [1., 0., 1.]])            
    |}]

*)



(* radius_neighbors *)
(*
>>> import numpy as np
>>> samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(radius=1.6)
>>> neigh.fit(samples)
NearestNeighbors(radius=1.6)
>>> rng = neigh.radius_neighbors([[1., 1., 1.]])
>>> print(np.asarray(rng[0][0]))
[1.5 0.5]
>>> print(np.asarray(rng[1][0]))
[1 2]


*)

(* TEST TODO
let%expect_test "RadiusNeighborsMixin.radius_neighbors" =
    import numpy as np    
    samples = [[0., 0., 0.], [0., .5, 0.], [1., 1., .5]]    
    let nearestNeighbors = Sklearn.Neighbors.nearestNeighbors in
    neigh = NearestNeighbors(radius=1.6)    
    print @@ fit neigh samples
    [%expect {|
            NearestNeighbors(radius=1.6)            
    |}]
    rng = neigh.radius_neighbors([[1., 1., 1.]])    
    print(np.asarray(rng[0][0]))    
    [%expect {|
            [1.5 0.5]            
    |}]
    print(np.asarray(rng[1][0]))    
    [%expect {|
            [1 2]            
    |}]

*)



(* radius_neighbors_graph *)
(*
>>> X = [[0], [3], [1]]
>>> from sklearn.neighbors import NearestNeighbors
>>> neigh = NearestNeighbors(radius=1.5)
>>> neigh.fit(X)
NearestNeighbors(radius=1.5)
>>> A = neigh.radius_neighbors_graph(X)
>>> A.toarray()
array([[1., 0., 1.],
       [0., 1., 0.],
       [1., 0., 1.]])


*)

(* TEST TODO
let%expect_test "RadiusNeighborsMixin.radius_neighbors_graph" =
    X = [[0], [3], [1]]    
    let nearestNeighbors = Sklearn.Neighbors.nearestNeighbors in
    neigh = NearestNeighbors(radius=1.5)    
    print @@ fit neigh x
    [%expect {|
            NearestNeighbors(radius=1.5)            
    |}]
    A = neigh.radius_neighbors_graph(X)    
    A.toarray()    
    [%expect {|
            array([[1., 0., 1.],            
                   [0., 1., 0.],            
                   [1., 0., 1.]])            
    |}]

*)



(* kneighbors_graph *)
(*
>>> X = [[0], [3], [1]]
>>> from sklearn.neighbors import kneighbors_graph
>>> A = kneighbors_graph(X, 2, mode='connectivity', include_self=True)
>>> A.toarray()
array([[1., 0., 1.],
       [0., 1., 1.],
       [1., 0., 1.]])


*)

(* TEST TODO
let%expect_test "kneighbors_graph" =
    X = [[0], [3], [1]]    
    let kneighbors_graph = Sklearn.Neighbors.kneighbors_graph in
    A = kneighbors_graph(X, 2, mode='connectivity', include_self=True)    
    A.toarray()    
    [%expect {|
            array([[1., 0., 1.],            
                   [0., 1., 1.],            
                   [1., 0., 1.]])            
    |}]

*)



(* radius_neighbors_graph *)
(*
>>> X = [[0], [3], [1]]
>>> from sklearn.neighbors import radius_neighbors_graph
>>> A = radius_neighbors_graph(X, 1.5, mode='connectivity',
...                            include_self=True)
>>> A.toarray()
array([[1., 0., 1.],
       [0., 1., 0.],
       [1., 0., 1.]])


*)

(* TEST TODO
let%expect_test "radius_neighbors_graph" =
    X = [[0], [3], [1]]    
    let radius_neighbors_graph = Sklearn.Neighbors.radius_neighbors_graph in
    A = radius_neighbors_graph(X, 1.5, mode='connectivity',include_self=True)    
    A.toarray()    
    [%expect {|
            array([[1., 0., 1.],            
                   [0., 1., 0.],            
                   [1., 0., 1.]])            
    |}]

*)



