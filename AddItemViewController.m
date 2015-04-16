//
//  AddItemViewController.m
//  Prabal TableView Test
//
//  Created by Harsh Sapra on 06/04/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import "AddItemViewController.h"

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
    
    NSMutableDictionary *beaconDetails = [[NSMutableDictionary alloc] init];
    [beaconDetails setValue:[NSString stringWithFormat:@"%@", self.beaconName.text] forKey:@"beaconName"];
    [beaconDetails setValue:[NSString stringWithFormat:@"%@", self.beaconUUID.text] forKey:@"beaconUUID"];
    [beaconDetails setValue:[NSString stringWithFormat:@"%@", self.beaconMajorValue.text] forKey:@"beaconMajorValue"];
    [beaconDetails setValue:[NSString stringWithFormat:@"%@", self.beaconMinorValue.text] forKey:@"beaconMinorValue"];
    [beaconDetails setValue:[NSString stringWithFormat:@"%@", self.beaconURL.text] forKey:@"beaconURL"];
    [beaconDetails setObject:self.beaconImage forKey:@"beaconImage"];
        
    [[NSUserDefaults standardUserDefaults] setObject:beaconDetails forKey:@"newCell"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isCellAdded"];    
}

- (IBAction)takePhotoButtonClicked:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)selectPhotoButtonClicked:(UIButton *)sender {
}

#pragma mark - Photo Picker Delegates

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.beaconImage = info[UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
