//
//  AddItemViewController.m
//  Prabal TableView Test
//
//  Created by Harsh Sapra on 06/04/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import "AddItemViewController.h"
#import "Beacon.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"isCellAdded"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)userDoneEnteringText:(id)sender {
    UITextField *textField = (UITextField *)sender;
    [textField resignFirstResponder];
}

- (IBAction)saveButtonClicked:(UIButton *)sender {
    if([self checkAllFieldsAreFilled]) {
        Beacon *beacon = [[Beacon alloc] init];
        
        NSDictionary *beaconDictionary = [beacon insertBeaconInDictionaryAndReturn:self.beaconName.text
                                                                          withUUID:self.beaconUUID.text
                                                                         withMajor:self.beaconMajorValue.text
                                                                         withMonor:self.beaconMinorValue.text
                                                                           withURL:self.beaconURL.text
                                                                          andImage:self.beaconImage];
        
        [self.beacons addObject:beaconDictionary];
    }
}

- (IBAction)takePhotoButtonClicked:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)selectPhotoButtonClicked:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - Photo Picker Delegates

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.beaconImage = info[UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Helper Methods

- (BOOL)checkAllFieldsAreFilled {
    BOOL isEverythingFilled = TRUE;
    
    if(!(self.beaconName.text && self.beaconUUID.text && self.beaconMajorValue.text && self.beaconMinorValue.text && self.beaconURL && self.beaconImage)) {
        isEverythingFilled = FALSE;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please fill all the details"
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        
        [alert show];
    }
    
    return isEverythingFilled;
}

@end
