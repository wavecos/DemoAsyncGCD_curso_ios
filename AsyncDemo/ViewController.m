//
//  ViewController.m
//  AsyncDemo
//
//  Created by Tekhne on 10/19/13.
//  Copyright (c) 2013 Tekhne. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

dispatch_queue_t myQueue;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)operacion:(id)sender {
    myQueue = dispatch_queue_create("com.tekhne.AsyncDemo", NULL);
    
    dispatch_async(myQueue, ^{
        [self operacionCostosa];
    });
    
}

-(void) operacionCostosa {
    [NSThread sleepForTimeInterval:5]; // Delay de 5 segundos!
    dispatch_async(dispatch_get_main_queue(), ^{
        self.resultado.text = [NSString stringWithFormat:@"Resultado = %d", arc4random()];
    });
}






@end
