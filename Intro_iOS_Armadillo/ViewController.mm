//
//  ViewController.m
//  Intro_iOS_Armadillo
//
//  Created by Simon Lucey on 9/17/15.
//  Copyright (c) 2015 CMU_16432. All rights reserved.
//

#import "ViewController.h"

#ifdef __cplusplus
#include "armadillo" // Includes the armadillo librray
#include <stdlib.h> // Include the standard library
#endif

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Create the matrix
    {
        using namespace arma;
        using namespace std;
        
        // Set the dimensions
        int D = 15;
        
        // In MATLAB: x = randn(D,1);
        fmat x; x.randn(D,1);
        // In MATLAB: A = randn(D,D);
        fmat A; A.randn(D,D);
        
        // Multiplication in Armadillo
        // In MATLAB:
        // >> y = A*x
        fmat y = A*x;
        cout << "y = A*x is: " << endl;
        cout << y << endl;
        
        // SVD in Armadillo
        // In MATLAB:
        // >> [U,S,V] = svd(A); s = diag(S);
        fmat U, V; fvec s;
        svd(U,s,V,A);
        cout << "Singular values of A are: " << endl;
        cout << s << endl;

        // Solve in Armadillo
        // In MATLAB:
        // >> xe = A/y;
        fmat xe = solve(A,y);
        cout << "Solution to A/y is: " << endl;
        cout << xe << endl;
        
        // Apply FFT using Armadillo
        // In MATLAB:
        // >> xf = fft(x)
        cx_fmat xf;
        xf = fft(x);
        cout << "The FFT of x is: " << endl;
        cout << xf << endl;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end