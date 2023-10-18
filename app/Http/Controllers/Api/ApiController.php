<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\OrderResource;
use App\Http\Resources\OrderProgressResource;
use App\Http\Resources\ProductResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\BrandResource;
use App\Http\Resources\FlagResource;
use App\Models\User;
use App\Models\Category;
use App\Models\ChildCategory;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use App\Mail\UserVerificationEmail;
use App\Models\BillingAddress;
use App\Models\Brand;
use App\Models\ContactRequest;
use App\Models\Flag;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\OrderPayment;
use App\Models\OrderProgress;
use App\Models\Product;
use App\Models\ProductReview;
use App\Models\PromoCode;
use App\Models\SubscribedUsers;
use App\Models\ShippingInfo;
use App\Models\Subcategory;
use App\Models\WishList;
use App\Models\EmailConfigure;
use App\Models\PaymentGateway;
use App\Models\ProductQuestionAnswer;
use App\Models\ProductVariant;
use App\Models\SmsGateway;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Image;

class ApiController extends BaseController
{
    const AUTHORIZATION_TOKEN = 'GenericCommerceV1-SBW7583837NUDD82';

    public function userLogin(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $login_type = $request->login_type; //1=>email; 2=>Phone
            $randomCode = rand(100000,999999);
            $defaultPassword = "GenericCommerceV15035";

            if($login_type == 1 && $request->email){ // email login

                $email = $request->email;
                $userInfo = User::where('email', $email)->first();
                if($userInfo){
                    $userInfo->verification_code = $randomCode;
                    $userInfo->updated_at = Carbon::now();
                    $userInfo->save();

                    try {

                        $emailConfig = EmailConfigure::where('status', 1)->orderBy('id', 'desc')->first();

                        $decryption = "";
                        if($emailConfig){
                            $ciphering = "AES-128-CTR";
                            $options = 0;
                            $decryption_iv = '1234567891011121';
                            $decryption_key = "GenericCommerceV1";
                            $decryption = openssl_decrypt ($emailConfig->password, $ciphering, $decryption_key, $options, $decryption_iv);
                        }

                        config([
                            'mail.mailers.smtp.host' => $emailConfig ? $emailConfig->host : '',
                            'mail.mailers.smtp.port' => $emailConfig ? $emailConfig->port : '',
                            'mail.mailers.smtp.username' => $emailConfig ? $emailConfig->email : '',
                            'mail.mailers.smtp.password' => $decryption != "" ? $decryption : '',
                            'mail.mailers.smtp.encryption' => $emailConfig ? ($emailConfig->encryption == 1 ? 'tls' : ($emailConfig->encryption == 2 ? 'ssl' : '')) : '',
                        ]);

                        $mailData = array();
                        $mailData['code'] = $randomCode;
                        Mail::to(trim($request->email))->send(new UserVerificationEmail($mailData));
                        return response()->json([
                            'success' => true,
                            'message' => "Verification Email Sent"
                        ], 200);
                    } catch(\Exception $e) {
                        return response()->json([
                            'success' => false,
                            'message' => "Something Went Wrong while Sending Email"
                        ], 200);
                    }

                } else{
                    User::insert([
                        'email' => $email,
                        'verification_code' => $randomCode,
                        'created_at' => Carbon::now(),
                        'password' => Hash::make($defaultPassword),
                    ]);

                    try {

                        $emailConfig = EmailConfigure::where('status', 1)->orderBy('id', 'desc')->first();

                        $decryption = "";
                        if($emailConfig){
                            $ciphering = "AES-128-CTR";
                            $options = 0;
                            $decryption_iv = '1234567891011121';
                            $decryption_key = "GenericCommerceV1";
                            $decryption = openssl_decrypt ($emailConfig->password, $ciphering, $decryption_key, $options, $decryption_iv);
                        }

                        config([
                            'mail.mailers.smtp.host' => $emailConfig ? $emailConfig->host : '',
                            'mail.mailers.smtp.port' => $emailConfig ? $emailConfig->port : '',
                            'mail.mailers.smtp.username' => $emailConfig ? $emailConfig->email : '',
                            'mail.mailers.smtp.password' => $decryption != "" ? $decryption : '',
                            'mail.mailers.smtp.encryption' => $emailConfig ? ($emailConfig->encryption == 1 ? 'tls' : ($emailConfig->encryption == 2 ? 'ssl' : '')) : '',
                        ]);

                        $mailData = array();
                        $mailData['code'] = $randomCode;
                        Mail::to(trim($request->email))->send(new UserVerificationEmail($mailData));

                        return response()->json([
                            'success' => true,
                            'message' => "Verification Email Sent"
                        ], 200);
                    } catch(\Exception $e) {
                        return response()->json([
                            'success' => false,
                            'message' => "Something Went Wrong while Sending Email"
                        ], 200);
                    }
                }

            } elseif($login_type == 2 && $request->phone) { //phone no login

                $phone = $request->phone;
                $userInfo = User::where('phone', $phone)->first();
                if($userInfo){

                    $userInfo->verification_code = $randomCode;
                    $userInfo->updated_at = Carbon::now();
                    $userInfo->save();

                    $smsGateway = SmsGateway::where('status', 1)->first();
                    if($smsGateway && $smsGateway->provider_name == 'Reve'){
                        $response = Http::get($smsGateway->api_endpoint, [
                            'apikey' => $smsGateway->api_key,
                            'secretkey' => $smsGateway->secret_key,
                            "callerID" => $smsGateway->sender_id,
                            "toUser" => $phone,
                            "messageContent" => "Verification Code is : ". $randomCode
                        ]);

                        if($response->status() == 200){
                            return response()->json([
                                'success' => true,
                                'message' => "SMS Sent Successfully" //$response
                            ], 200);
                        } else {
                            return response()->json([
                                'success' => false,
                                'message' => "Failed to Send SMS" //$response
                            ], 200);
                        }
                    } elseif($smsGateway && $smsGateway->provider_name == 'ElitBuzz'){

                        $response = Http::get($smsGateway->api_endpoint, [
                            'api_key' => $smsGateway->api_key,
                            "type" => "text",
                            "contacts" => $phone, //“88017xxxxxxxx,88018xxxxxxxx”
                            "senderid" => $smsGateway->sender_id,
                            "msg" => "Verification Code is : ". $randomCode
                        ]);

                        if($response->status() == 200){
                            return response()->json([
                                'success' => true,
                                'message' => "SMS Sent Successfully" //$response
                            ], 200);
                        } else {
                            return response()->json([
                                'success' => false,
                                'message' => "Failed to Send SMS" //$response
                            ], 200);
                        }
                    } else {
                        return response()->json([
                            'success' => false,
                            'message' => "Failed to Send SMS" //$response
                        ], 200);
                    }

                } else{
                    User::insertGetId([
                        'phone' => $phone,
                        'verification_code' => $randomCode,
                        'created_at' => Carbon::now(),
                        'password' => Hash::make($defaultPassword),
                    ]);

                    $smsGateway = SmsGateway::where('status', 1)->first();
                    if($smsGateway && $smsGateway->provider_name == 'Reve'){
                        $response = Http::get($smsGateway->api_endpoint, [
                            'apikey' => $smsGateway->api_key,
                            'secretkey' => $smsGateway->secret_key,
                            "callerID" => $smsGateway->sender_id,
                            "toUser" => $phone,
                            "messageContent" => "Verification Code is : ". $randomCode
                        ]);

                        if($response->status() == 200){
                            return response()->json([
                                'success' => true,
                                'message' => "SMS Sent Successfully" //$response
                            ], 200);
                        } else {
                            return response()->json([
                                'success' => false,
                                'message' => "Failed to Send SMS" //$response
                            ], 200);
                        }
                    } elseif($smsGateway && $smsGateway->provider_name == 'ElitBuzz'){

                        $response = Http::get($smsGateway->api_endpoint, [
                            'api_key' => $smsGateway->api_key,
                            "type" => "text",
                            "contacts" => $phone, //“88017xxxxxxxx,88018xxxxxxxx”
                            "senderid" => $smsGateway->sender_id,
                            "msg" => "Verification Code is : ". $randomCode
                        ]);

                        if($response->status() == 200){
                            return response()->json([
                                'success' => true,
                                'message' => "SMS Sent Successfully" //$response
                            ], 200);
                        } else {
                            return response()->json([
                                'success' => false,
                                'message' => "Failed to Send SMS" //$response
                            ], 200);
                        }
                    } else {
                        return response()->json([
                            'success' => false,
                            'message' => "Failed to Send SMS" //$response
                        ], 200);
                    }
                }

            } else{
                return response()->json([
                    'success' => false,
                    'message' => "Something Went Wrong"
                ], 200);
            }

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function verifyUserLogin(Request $request){

        $defaultPassword = "GenericCommerceV15035";

        if(Auth::attempt(['email' => $request->email, 'password' => $defaultPassword, 'verification_code' => $request->code]) || Auth::attempt(['phone' => $request->phone, 'password' => $defaultPassword, 'verification_code' => $request->code])){

            $user = Auth::user();

            User::where('id', $user->id)->update([
                'delete_request_submitted' => 0,
                'delete_request_submitted_at' => NULL,
            ]);

            $success['token'] =  $user->createToken('GenericCommerceV1')->plainTextToken;
            $success['name'] =  $user->name;
            $success['email'] =  $user->email;
            $success['phone'] =  $user->phone;
            $success['image'] =  $user->image;
            $success['address'] =  $user->address;
            $success['balance'] =  $user->balance;

            return response()->json([
                'success'=> true,
                'message'=> 'Successfully Logged In',
                'data' => $success
            ]);

        }
        else{
            $data = array();
            return response()->json([
                'success'=> false,
                'message'=> 'Wrong Login Credentials',
                'data' => $data
            ]);
        }
    }

    public function userProfileInfo(){

        $userInfo = User::where('id', auth()->user()->id)->first();

        $name = $userInfo->name;
        $email = $userInfo->email;
        $phone = $userInfo->phone;
        $image = $userInfo->image;
        $balance = $userInfo->balance;
        $address = $userInfo->address;
        $totalProductInWishList = WishList::where('user_id', $userInfo->id)->count();
        $totalOrders = Order::where('user_id', $userInfo->id)->count();

        $data = array(
            'name' => $name,
            'email' => $email,
            'phone' => $phone,
            'balance' => $balance,
            'image' => $image,
            'address' => $address,
            'totalProductInWishList' => $totalProductInWishList,
            'totalOrders' => $totalOrders,
        );

        return $this->sendResponse($data, 'User Profile Retrieved Successfully.');

    }

    public function userProfileUpdate(Request $request){

        $userInfo = User::where('id', auth()->user()->id)->first();
        $userImage = $userInfo->image;
        if ($request->hasFile('image')){

            if($userImage && file_exists(public_path($userImage))){
                unlink(public_path($userImage));
            }

            $get_image = $request->file('image');
            $image_name = str::random(5) . time() . '.' . $get_image->getClientOriginalExtension();
            $location = public_path('userProfileImages/');
            Image::make($get_image)->save($location . $image_name, 50);
            $userImage = "userProfileImages/" . $image_name;
        }

        $user_id = auth()->user()->id;
        $name = $request->name;
        $phone = $request->phone;
        $email = $request->email;
        $address = $request->address;
        $current_password = $request->current_password;
        $new_password = $request->new_password;

        if($email != '' && $userInfo->email != $email){
            $email_check = User::where('email', $email)->first();
            if($email_check){
                return response()->json([
                    'success'=> false,
                    'message'=> 'Email already used ! Please use another Email'
                ]);
            }
        }
        if($phone != '' && $userInfo->phone != $phone){
            $phone_check = User::where('phone', $phone)->first();
            if($phone_check){
                return response()->json([
                    'success'=> false,
                    'message'=> 'Mobile No already used ! Please use another Mobile No'
                ]);
            }
        }

        if($current_password != '' && $new_password != ''){
            if(Hash::check($current_password, $userInfo->password)){
                User::where('id', $user_id)->update([
                    'password' => Hash::make($new_password),
                    'updated_at' => Carbon::now()
                ]);
            } else {
                return response()->json([
                    'success'=> false,
                    'message'=> 'Your Current Password is Incorrect'
                ]);
            }
        }

        if(($email == '' || $email == NULL) && ($phone == '' || $phone == NULL)){
            return response()->json([
                'success'=> false,
                'message'=> 'Both Email & Phone Cannot be Null'
            ]);
        } else {
            $userInfo->name = $name;
            $userInfo->phone = $phone;
            $userInfo->email = $email;
            $userInfo->image = $userImage;
            $userInfo->address = $address;
            $userInfo->updated_at = Carbon::now();
            $userInfo->save();

            return response()->json([
                'success'=> true,
                'message'=> 'Profile Updated Successfully',
                'data' => $userInfo
            ]);
        }

    }

    public function getCategoryTree(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $categories = Category::orderBy('serial', 'asc')->where('status', 1)->get();
            return response()->json([
                'success' => true,
                'data' => CategoryResource::collection($categories)
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getCategoryList(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $categories = Category::orderBy('serial', 'asc')->where('status', 1)->get();
            return response()->json([
                'success' => true,
                'data' => $categories
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getFeaturedSubcategory(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $subcategories = DB::table('subcategories')
                                ->join('categories', 'subcategories.category_id', '=', 'categories.id')
                                ->select('subcategories.*', 'categories.name as category_name')
                                ->where('subcategories.status', 1)
                                ->where('subcategories.featured', 1)
                                ->orderBy('subcategories.name', 'desc')
                                ->get();

            return response()->json([
                'success' => true,
                'data' => $subcategories
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getSubcategoryOfCategory(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $subcategories = DB::table('subcategories')
                                ->join('categories', 'subcategories.category_id', '=', 'categories.id')
                                ->select('subcategories.*', 'categories.name as category_name')
                                ->where('category_id', $request->category_id)
                                ->where('subcategories.status', 1)
                                ->orderBy('subcategories.name', 'desc')
                                ->get();

            return response()->json([
                'success' => true,
                'data' => $subcategories
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getChildcategoryOfSubcategory(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('child_categories')
                        ->join('categories', 'child_categories.category_id', '=' , 'categories.id')
                        ->join('subcategories', 'child_categories.subcategory_id', '=' , 'subcategories.id')
                        ->select('child_categories.*', 'categories.name as category_name', 'subcategories.name as subcategory_name')
                        ->where('child_categories.category_id', $request->category_id)
                        ->where('child_categories.subcategory_id', $request->subcategory_id)
                        ->where('child_categories.status', 1)
                        ->orderBy('child_categories.name', 'asc')
                        ->get();

            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getAllProducts(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                ->leftJoin('product_models', 'products.model_id', '=', 'product_models.id')
                ->leftJoin('product_warrenties', 'products.warrenty_id', '=', 'product_warrenties.id')
                ->select('products.*', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name', 'units.name as unit_name', 'flags.name as flag_name', 'brands.name as brand_name', 'product_models.name as model_name', 'product_warrenties.name as product_warrenty')
                ->where('products.status', 1)
                ->orderBy('products.id', 'desc')
                ->paginate(20);

            return response()->json([
                'success' => true,
                'data' => ProductResource::collection($data)->resource
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getRelatedProducts(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $prodInfo = Product::where('id', $request->product_id)->first();
            $brand_id = $prodInfo->brand_id;
            $categoryId = $prodInfo->category_id;

            $data = DB::table('products')
                        ->join('categories', 'products.category_id', '=', 'categories.id')
                        ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                        ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                        ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                        ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                        ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                        ->leftJoin('product_models', 'products.model_id', '=', 'product_models.id')
                        ->leftJoin('product_warrenties', 'products.warrenty_id', '=', 'product_warrenties.id')
                        ->select('products.*', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name', 'units.name as unit_name', 'flags.name as flag_name', 'brands.name as brand_name', 'product_models.name as model_name', 'product_warrenties.name as product_warrenty')
                        ->where('products.status', 1)
                        ->when($brand_id, function($query) use ($brand_id, $categoryId){
                            if($brand_id > 0)
                                return $query->where('products.brand_id', $brand_id);
                            else
                            return $query->where('products.category_id', $categoryId);
                        })
                        ->where('products.id', '!=', $request->product_id)
                        ->inRandomOrder()
                        ->skip(0)
                        ->limit(5)
                        ->get();

            return response()->json([
                'success' => true,
                'data' => ProductResource::collection($data)
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getYouMayLikeProducts(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $prodInfo = Product::where('id', $request->product_id)->first();
            $categoryId = $prodInfo->category_id;

            $data = DB::table('products')
                        ->join('categories', 'products.category_id', '=', 'categories.id')
                        ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                        ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                        ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                        ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                        ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                        ->leftJoin('product_models', 'products.model_id', '=', 'product_models.id')
                        ->leftJoin('product_warrenties', 'products.warrenty_id', '=', 'product_warrenties.id')
                        ->select('products.*', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name', 'units.name as unit_name', 'flags.name as flag_name', 'brands.name as brand_name', 'product_models.name as model_name', 'product_warrenties.name as product_warrenty')
                        ->where('products.status', 1)
                        ->where('products.id', '!=', $request->product_id)
                        ->where('products.category_id', $categoryId)
                        ->skip(0)
                        ->limit(6)
                        ->inRandomOrder()
                        ->get();

            return response()->json([
                'success' => true,
                'data' => ProductResource::collection($data)
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function categoryWiseProducts(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $categoryInfo = Category::where('slug', $request->category_slug)->first();

            $data = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                ->leftJoin('product_models', 'products.model_id', '=', 'product_models.id')
                ->leftJoin('product_warrenties', 'products.warrenty_id', '=', 'product_warrenties.id')
                ->select('products.*', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name', 'units.name as unit_name', 'flags.name as flag_name', 'brands.name as brand_name', 'product_models.name as model_name', 'product_warrenties.name as product_warrenty')
                ->where('categories.id', $categoryInfo ? $categoryInfo->id : 0)
                ->where('products.status', 1)
                ->orderBy('products.id', 'desc')
                ->paginate(10);

            return response()->json([
                'success' => true,
                'data' => ProductResource::collection($data)->resource
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function subcategoryWiseProducts(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $subCategoryInfo = Subcategory::where('slug', $request->subcategory_slug)->first();

            $data = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                ->leftJoin('product_models', 'products.model_id', '=', 'product_models.id')
                ->leftJoin('product_warrenties', 'products.warrenty_id', '=', 'product_warrenties.id')
                ->select('products.*', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name', 'units.name as unit_name', 'flags.name as flag_name', 'brands.name as brand_name', 'product_models.name as model_name', 'product_warrenties.name as product_warrenty')
                ->where('subcategories.id', $subCategoryInfo ? $subCategoryInfo->id : 0)
                ->where('products.status', 1)
                ->orderBy('products.id', 'desc')
                ->paginate(10);

            return response()->json([
                'success' => true,
                'data' => ProductResource::collection($data)->resource
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function childcategoryWiseProducts(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $childCategoryInfo = ChildCategory::where('slug', $request->childcategory_slug)->first();

            $data = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                ->leftJoin('product_models', 'products.model_id', '=', 'product_models.id')
                ->leftJoin('product_warrenties', 'products.warrenty_id', '=', 'product_warrenties.id')
                ->select('products.*', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name', 'units.name as unit_name', 'flags.name as flag_name', 'brands.name as brand_name', 'product_models.name as model_name', 'product_warrenties.name as product_warrenty')
                ->where('child_categories.id', $childCategoryInfo ? $childCategoryInfo->id : 0)
                ->where('products.status', 1)
                ->orderBy('products.id', 'desc')
                ->paginate(10);

            return response()->json([
                'success' => true,
                'data' => ProductResource::collection($data)->resource
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }


    public function productDetails(Request $request, $id){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                ->leftJoin('product_models', 'products.model_id', '=', 'product_models.id')
                ->leftJoin('product_warrenties', 'products.warrenty_id', '=', 'product_warrenties.id')
                ->select('products.*', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name', 'units.name as unit_name', 'flags.name as flag_name', 'brands.name as brand_name', 'product_models.name as model_name', 'product_warrenties.name as product_warrenty')
                ->where('products.id', $id)
                ->orWhere('products.slug', $id)
                ->first();

            return response()->json([
                'success' => true,
                'data' => new ProductResource($data)
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function flagWiseProducts(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                ->leftJoin('product_models', 'products.model_id', '=', 'product_models.id')
                ->leftJoin('product_warrenties', 'products.warrenty_id', '=', 'product_warrenties.id')
                ->select('products.*', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name', 'units.name as unit_name', 'flags.name as flag_name', 'brands.name as brand_name', 'product_models.name as model_name', 'product_warrenties.name as product_warrenty')
                ->where('products.flag_id', $request->flag)
                ->where('products.status', 1)
                ->orderBy('products.id', 'desc')
                ->skip(0)
                ->limit(6)
                ->get();

            return response()->json([
                'success' => true,
                'data' => ProductResource::collection($data)
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function featuredFlagWiseProducts(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = Flag::where('featured', 1)->where('status', 1)->get();

            return response()->json([
                'success' => true,
                'data' => FlagResource::collection($data)
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function flagWiseAllProducts(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                ->leftJoin('product_models', 'products.model_id', '=', 'product_models.id')
                ->leftJoin('product_warrenties', 'products.warrenty_id', '=', 'product_warrenties.id')
                ->select('products.*', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name', 'units.name as unit_name', 'flags.name as flag_name', 'brands.name as brand_name', 'product_models.name as model_name', 'product_warrenties.name as product_warrenty')
                ->where('products.flag_id', $request->flag)
                ->where('products.status', 1)
                ->orderBy('products.id', 'desc')
                ->paginate(20);

            return response()->json([
                'success' => true,
                'data' => ProductResource::collection($data)->resource
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getAllFlags(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $flags = Flag::orderBy('name', 'asc')->where('status', 1)->get();
            return response()->json([
                'success' => true,
                'data' => $flags
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getAllBrands(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $brands = Brand::orderBy('serial', 'asc')->where('status', 1)->get();
            return response()->json([
                'success' => true,
                'data' => $brands
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function searchProducts(Request $request){ //post method
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $brandInfo = Brand::where('slug', $request->brand_slug)->first();
            $brand_id = $brandInfo ? $brandInfo->id : 0;

            $data = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                ->leftJoin('product_models', 'products.model_id', '=', 'product_models.id')
                ->leftJoin('product_warrenties', 'products.warrenty_id', '=', 'product_warrenties.id')
                ->select('products.*', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name', 'units.name as unit_name', 'flags.name as flag_name', 'brands.name as brand_name', 'product_models.name as model_name', 'product_warrenties.name as product_warrenty')
                ->where('products.status', 1)
                ->where('products.name', 'LIKE', '%'.$request->search_keyword.'%')
                ->orwhere('categories.name', 'LIKE', '%'.$request->search_keyword.'%')
                ->orwhere('subcategories.name', 'LIKE', '%'.$request->search_keyword.'%')
                ->orwhere('products.tags', 'LIKE', '%'.$request->search_keyword.'%')
                ->orwhere('brands.name', 'LIKE', '%'.$request->search_keyword.'%')
                ->when($brand_id, function($query) use ($brand_id){
                    if($brand_id > 0)
                        return $query->where('products.brand_id', $brand_id);
                })
                ->orderBy('products.id', 'desc')
                ->paginate(20);

            return response()->json([
                'success' => true,
                'data' => ProductResource::collection($data)->resource
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function searchLiveProducts(Request $request){ //post method
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $brandInfo = Brand::where('slug', $request->brand_slug)->first();
            $brand_id = $brandInfo ? $brandInfo->id : 0;
            $keyword = $request->search_keyword;

            if($brand_id != '' || $keyword != ''){

                $data = DB::table('products')
                    ->join('categories', 'products.category_id', '=', 'categories.id')
                    ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                    ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                    ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                    ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                    ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                    ->leftJoin('product_models', 'products.model_id', '=', 'product_models.id')
                    ->leftJoin('product_warrenties', 'products.warrenty_id', '=', 'product_warrenties.id')
                    ->select('products.*', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name', 'units.name as unit_name', 'flags.name as flag_name', 'brands.name as brand_name', 'product_models.name as model_name', 'product_warrenties.name as product_warrenty')
                    ->where('products.status', 1)

                    // ->when($keyword, function($query) use ($keyword){
                    //     return $query->where('products.name', 'LIKE', '%'.$keyword.'%')
                    //     ->orwhere('categories.name', 'LIKE', '%'.$keyword.'%')
                    //     ->orwhere('subcategories.name', 'LIKE', '%'.$keyword.'%')
                    //     ->orwhere('products.tags', 'LIKE', '%'.$keyword.'%')
                    //     ->orwhere('brands.name', 'LIKE', '%'.$keyword.'%');
                    // })

                    ->where('products.name', 'LIKE', '%'.$keyword.'%')
                    ->when($brand_id, function($query) use ($brand_id){
                        if($brand_id > 0)
                            return $query->where('products.brand_id', $brand_id);
                    })

                    ->orderBy('products.id', 'desc')
                    ->skip(0)
                    ->limit(5)
                    ->get();

                return response()->json([
                    'success' => true,
                    'data' => ProductResource::collection($data)
                ], 200);

            } else {
                return response()->json([
                    'success' => true,
                    'data' => array()
                ], 200);
            }



        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function searchProductsGet(Request $request){  //get method
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $brandInfo = Brand::where('slug', $request->brand_slug)->first();
            $brand_id = $brandInfo ? $brandInfo->id : 0;

            $data = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->leftJoin('subcategories', 'products.subcategory_id', '=', 'subcategories.id')
                ->leftJoin('child_categories', 'products.childcategory_id', '=', 'child_categories.id')
                ->leftJoin('units', 'products.unit_id', '=', 'units.id')
                ->leftJoin('flags', 'products.flag_id', '=', 'flags.id')
                ->leftJoin('brands', 'products.brand_id', '=', 'brands.id')
                ->leftJoin('product_models', 'products.model_id', '=', 'product_models.id')
                ->leftJoin('product_warrenties', 'products.warrenty_id', '=', 'product_warrenties.id')
                ->select('products.*', 'categories.name as category_name', 'subcategories.name as subcategory_name', 'child_categories.name as childcategory_name', 'units.name as unit_name', 'flags.name as flag_name', 'brands.name as brand_name', 'product_models.name as model_name', 'product_warrenties.name as product_warrenty')
                ->where('products.status', 1)
                ->where('products.name', 'LIKE', '%'.$request->search_keyword.'%')
                ->orwhere('categories.name', 'LIKE', '%'.$request->search_keyword.'%')
                ->orwhere('subcategories.name', 'LIKE', '%'.$request->search_keyword.'%')
                ->orwhere('products.tags', 'LIKE', '%'.$request->search_keyword.'%')
                ->orwhere('brands.name', 'LIKE', '%'.$request->search_keyword.'%')
                ->when($brand_id, function($query) use ($brand_id){
                    if($brand_id > 0)
                        return $query->where('products.brand_id', $brand_id);
                })
                ->orderBy('products.id', 'desc')
                ->paginate(20);

            return response()->json([
                'success' => true,
                'data' => ProductResource::collection($data)->resource
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function termsAndCondition(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('terms_and_policies')->where('id', 1)->select('terms')->first();

            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function privacyPolicy(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('terms_and_policies')->where('id', 1)->select('privacy_policy')->first();

            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function shippingPolicy(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('terms_and_policies')->where('id', 1)->select('shipping_policy')->first();

            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function returnPolicy(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('terms_and_policies')->where('id', 1)->select('return_policy')->first();

            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function aboutUs(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('general_infos')->where('id', 1)->select('about_us')->first();

            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getAllFaq(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('faqs')->orderBy('id', 'desc')->get();

            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function generalInfo(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('general_infos')->where('id', 1)->first();

            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getAllSliders(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('banners')->where('type', 1)->where('status', 1)->orderBy('serial', 'asc')->get();

            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getAllBanners(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('banners')->where('type', 2)->where('status', 1)->orderBy('serial', 'asc')->get();

            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getPromotionalBanner(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('promotional_banners')->where('id', 1)->first();

            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function submitContactRequest(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            ContactRequest::insert([
                'name' => $request->name,
                'email' => $request->email,
                'message' => $request->message,
                'phone' => isset($request->phone) ? $request->phone : NULL,
                'company_name' => isset($request->company_name) ? $request->company_name : NULL,
                'status' => 0,
                'created_at' => Carbon::now(),
            ]);

            return response()->json([
                'success' => true,
                'message' => "Request is Submitted"
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function orderCheckout(Request $request){

        date_default_timezone_set("Asia/Dhaka");

        $orderId = Order::insertGetId([
            'order_no' => time().rand(100,999),
            'user_id' => auth()->user()->id,
            'order_date' => date("Y-m-d H:i:s"),
            'estimated_dd' => date('Y-m-d', strtotime("+7 day", strtotime(date("Y-m-d")))),
            'payment_method' => NULL,
            'trx_id' => time().str::random(5),
            'order_status' => 0,
            'sub_total' => 0,
            'coupon_code' => NULL,
            'discount' => 0,
            'delivery_fee' => 0,
            'vat' => 0,
            'tax' => 0,
            'total' => 0,
            'order_note' => isset($request->special_note) ? $request->special_note : '',
            'delivery_method' => isset($request->delivery_method) ? $request->delivery_method : '',
            'slug' => str::random(5) . time(),
            'created_at' => Carbon::now()
        ]);

        OrderProgress::insert([
            'order_id' => $orderId,
            'order_status' => 0,
            'created_at' => Carbon::now()
        ]);

        $index = 0;
        $totalOrderAmount = 0;

        // for a reason=== dont change the code
        $productIdArray = explode(",", $request->product_id[0]);
        $qtyArray = explode(",", $request->qty[0]);
        $unitPriceArray = explode(",", $request->unit_price[0]);
        $unitIdArray = explode(",", $request->unit_id[0]);

        // variants added later
        $colorIdArray = explode(",", $request->color_id[0]);
        $regionIdArray = explode(",", $request->region_id[0]);
        $simIdArray = explode(",", $request->sim_id[0]);
        $storageIdArray = explode(",", $request->storage_id[0]);
        $warrentyIdArray = explode(",", $request->warrenty_id[0]);
        $deviceConditionIdArray = explode(",", $request->device_condition_id[0]);

        foreach($productIdArray as $productId){

            $quantity = (double) trim($qtyArray[$index]);
            $unitPrice = (double) trim($unitPriceArray[$index]);
            $pId = (int) trim($productId);
            $unitId = (double) trim($unitIdArray[$index]);

            // variants added later | chosing default variant while no variant is selected although product has variant
            $prodInfo = Product::where('id', $pId)->first();
            $colorId = (double) trim($colorIdArray[$index]);
            $regionId = (double) trim($regionIdArray[$index]);
            $simId = (double) trim($simIdArray[$index]);
            $storageId = (double) trim($storageIdArray[$index]);
            $warrentyId = (double) trim($warrentyIdArray[$index]);
            $deviceConditionId = (double) trim($deviceConditionIdArray[$index]);
            if($prodInfo->has_variant == 1){
                $variants = ProductVariant::where('product_id', $prodInfo->id)->where('stock', '>', 0)->count();
                if($variants > 0){
                    if(!$colorId && !$regionId && !$simId && !$storageId && !$warrentyId && !$deviceConditionId){
                        $defaultVariant = ProductVariant::where('product_id', $prodInfo->id)->where('stock', '>', 0)->orderBy('price', 'desc')->first();
                        $colorId = $defaultVariant->color_id;
                        $regionId = $defaultVariant->region_id;
                        $simId = $defaultVariant->sim_id;
                        $storageId = $defaultVariant->storage_type_id;
                        $warrentyId = $defaultVariant->warrenty_id;
                        $deviceConditionId = $defaultVariant->device_condition_id;
                        $unitPrice = $defaultVariant->discounted_price > 0 ? $defaultVariant->discounted_price : $defaultVariant->price;
                    }
                }
            }

            Product::where('id', $pId)->decrement("stock", $quantity);
            OrderDetails::insert([
                'order_id' => $orderId,
                'product_id' => $pId,

                // VARIANT
                'color_id' => $colorId,
                'region_id' => $regionId,
                'sim_id' => $simId,
                'storage_id' => $storageId,
                'warrenty_id' => $warrentyId,
                'device_condition_id' => $deviceConditionId,

                'qty' => $quantity,
                'unit_id' => $unitId,
                'unit_price' => $unitPrice,
                'total_price' => $quantity * $unitPrice,
                'created_at' => Carbon::now()
            ]);

            $totalOrderAmount = $totalOrderAmount + ($quantity * $unitPrice);
            $index++;
        }


        // calculating coupon discount
        $discount = 0;
        $promoInfo = PromoCode::where('code', $request->coupon_code)->where('status', 1)->where('effective_date', '<=', date("Y-m-d"))->where('expire_date', '>=', date("Y-m-d"))->first();
        if($promoInfo){
            $alreadyUsed = Order::where('user_id', auth()->user()->id)->where('coupon_code', $request->coupon_code)->count();
            if($alreadyUsed == 0){
                if($promoInfo->type == 1){
                    $discount = $promoInfo->value;
                } else {
                    $discount = ($totalOrderAmount*$promoInfo->value)/100;
                }
            }
        }
        // calculating coupon discount

        Order::where('id', $orderId)->update([
            'sub_total' => $totalOrderAmount,
            'coupon_code' => $request->coupon_code,
            'discount' => $discount,
            'total' => $totalOrderAmount - $discount,
        ]);

        return response()->json([
            'success' => true,
            'message' => "Order is Submitted",
            'data' => new OrderResource(Order::where('id', $orderId)->first())
        ], 200);

    }


    public function guestOrderCheckout(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            date_default_timezone_set("Asia/Dhaka");

            $orderId = Order::insertGetId([
                'order_no' => time().rand(100,999),
                // 'user_id' => auth()->user()->id,
                'order_date' => date("Y-m-d H:i:s"),
                'estimated_dd' => date('Y-m-d', strtotime("+7 day", strtotime(date("Y-m-d")))),
                'payment_method' => NULL,
                'trx_id' => time().str::random(5),
                'order_status' => 0,
                'sub_total' => 0,
                'coupon_code' => NULL,
                'discount' => 0,
                'delivery_fee' => 0,
                'vat' => 0,
                'tax' => 0,
                'total' => 0,
                'order_note' => isset($request->special_note) ? $request->special_note : '',
                'delivery_method' => isset($request->delivery_method) ? $request->delivery_method : '',
                'slug' => str::random(5) . time(),
                'created_at' => Carbon::now()
            ]);

            OrderProgress::insert([
                'order_id' => $orderId,
                'order_status' => 0,
                'created_at' => Carbon::now()
            ]);

            $index = 0;
            $totalOrderAmount = 0;

            // for a reason=== dont change the code
            $productIdArray = explode(",", $request->product_id[0]);
            $qtyArray = explode(",", $request->qty[0]);
            $unitPriceArray = explode(",", $request->unit_price[0]);
            $unitIdArray = explode(",", $request->unit_id[0]);

            // variants added later
            $colorIdArray = explode(",", $request->color_id[0]);
            $regionIdArray = explode(",", $request->region_id[0]);
            $simIdArray = explode(",", $request->sim_id[0]);
            $storageIdArray = explode(",", $request->storage_id[0]);
            $warrentyIdArray = explode(",", $request->warrenty_id[0]);
            $deviceConditionIdArray = explode(",", $request->device_condition_id[0]);

            foreach($productIdArray as $productId){

                $quantity = (double) trim($qtyArray[$index]);
                $unitPrice = (double) trim($unitPriceArray[$index]);
                $pId = (int) trim($productId);
                $unitId = (double) trim($unitIdArray[$index]);

                // variants added later | chosing default variant while no variant is selected although product has variant
                $prodInfo = Product::where('id', $pId)->first();
                $colorId = (double) trim($colorIdArray[$index]);
                $regionId = (double) trim($regionIdArray[$index]);
                $simId = (double) trim($simIdArray[$index]);
                $storageId = (double) trim($storageIdArray[$index]);
                $warrentyId = (double) trim($warrentyIdArray[$index]);
                $deviceConditionId = (double) trim($deviceConditionIdArray[$index]);
                if($prodInfo->has_variant == 1){
                    $variants = ProductVariant::where('product_id', $prodInfo->id)->where('stock', '>', 0)->count();
                    if($variants > 0){
                        if(!$colorId && !$regionId && !$simId && !$storageId && !$warrentyId && !$deviceConditionId){
                            $defaultVariant = ProductVariant::where('product_id', $prodInfo->id)->where('stock', '>', 0)->orderBy('price', 'desc')->first();
                            $colorId = $defaultVariant->color_id;
                            $regionId = $defaultVariant->region_id;
                            $simId = $defaultVariant->sim_id;
                            $storageId = $defaultVariant->storage_type_id;
                            $warrentyId = $defaultVariant->warrenty_id;
                            $deviceConditionId = $defaultVariant->device_condition_id;
                            $unitPrice = $defaultVariant->discounted_price > 0 ? $defaultVariant->discounted_price : $defaultVariant->price;
                        }
                    }
                }

                Product::where('id', $pId)->decrement("stock", $quantity);
                OrderDetails::insert([
                    'order_id' => $orderId,
                    'product_id' => $pId,

                    // VARIANT
                    'color_id' => $colorId,
                    'region_id' => $regionId,
                    'sim_id' => $simId,
                    'storage_id' => $storageId,
                    'warrenty_id' => $warrentyId,
                    'device_condition_id' => $deviceConditionId,

                    'qty' => $quantity,
                    'unit_id' => $unitId,
                    'unit_price' => $unitPrice,
                    'total_price' => $quantity * $unitPrice,
                    'created_at' => Carbon::now()
                ]);

                $totalOrderAmount = $totalOrderAmount + ($quantity * $unitPrice);
                $index++;
            }


            // calculating coupon discount
            $discount = 0;
            $promoInfo = PromoCode::where('code', $request->coupon_code)->where('status', 1)->where('effective_date', '<=', date("Y-m-d"))->where('expire_date', '>=', date("Y-m-d"))->first();
            if($promoInfo){
                if($promoInfo->type == 1){
                    $discount = $promoInfo->value;
                } else {
                    $discount = ($totalOrderAmount*$promoInfo->value)/100;
                }
            }
            // calculating coupon discount

            Order::where('id', $orderId)->update([
                'sub_total' => $totalOrderAmount,
                'coupon_code' => $request->coupon_code,
                'discount' => $discount,
                'total' => $totalOrderAmount - $discount,
            ]);

            return response()->json([
                'success' => true,
                'message' => "Order is Submitted",
                'data' => new OrderResource(Order::where('id', $orderId)->first())
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }


    public function shippingBillingInfo(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            ShippingInfo::where('order_id', $request->order_id)->delete();
            ShippingInfo::insert([
                'order_id' => $request->order_id,
                'full_name' => $request->full_name,
                'phone' => $request->phone,
                'email' => $request->email,
                'gender' => $request->gender,
                'address' => $request->address,
                'thana' => $request->thana,
                'post_code' => $request->post_code,
                'city' => $request->city,
                'country' => $request->country,
                'created_at' => Carbon::now()
            ]);

            BillingAddress::where('order_id', $request->order_id)->delete();
            BillingAddress::insert([
                'order_id' => $request->order_id,
                'address' => $request->billing_address,
                'post_code' => $request->billing_post_code,
                'thana' => $request->billing_thana,
                'city' => $request->billing_city,
                'country' => $request->billing_country,
                'created_at' => Carbon::now()
            ]);

            if(strtolower(trim($request->city)) == 'dhaka'){
                $orderInfo = Order::where('id', $request->order_id)->first();
                $orderInfo->delivery_fee = 60;
                $orderInfo->total = $orderInfo->total + 60;
                $orderInfo->complete_order = 1;
                $orderInfo->save();
            } else {
                $orderInfo = Order::where('id', $request->order_id)->first();
                $orderInfo->delivery_fee = 100;
                $orderInfo->total = $orderInfo->total + 100;
                $orderInfo->complete_order = 1;
                $orderInfo->save();
            }

            return response()->json([
                'success' => true,
                'message' => "Order Info Updated",
                'data' => new OrderResource(Order::where('id', $request->order_id)->first())
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function orderPreview(Request $request){
        return response()->json([
            'success' => true,
            'message' => "Order Preview",
            'data' => new OrderResource(Order::where('id', $request->order_id)->first())
        ], 200);
    }

    public function getMyOrders(Request $request){
        $data = DB::table('orders')->where('user_id', auth()->user()->id)->where('complete_order', 1)->orderBy('id', 'desc')->paginate(100);
        return response()->json([
            'success' => true,
            'date' => OrderResource::collection($data)->resource
        ], 200);
    }

    public function orderProgress(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $order = DB::table('orders')->where('order_no', $request->order_no)->first();
            $data = DB::table('order_progress')->where('order_id', $order->id)->orderBy('id', 'asc')->get();

            return response()->json([
                'success' => true,
                'date' => OrderProgressResource::collection($data)
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function orderCashOnDelivery(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $orderId = $request->order_id;
            $orderInfo = Order::where('id', $orderId)->first();
            $orderInfo->bank_tran_id = "Not Available (COD)";
            $orderInfo->payment_method = 1;
            $orderInfo->payment_status = 1; //success
            $orderInfo->save();

            OrderPayment::insert([
                'order_id' => $orderInfo->id,
                'payment_through' => "COD",
                'tran_id' => $orderInfo->tran_id,
                'val_id' => NULL,
                'amount' => $orderInfo->total,
                'card_type' => NULL,
                'store_amount' => $orderInfo->total,
                'card_no' => NULL,
                'status' => "VALID",
                'tran_date' => date("Y-m-d H:i:s"),
                'currency' => "BDT",
                'card_issuer' => NULL,
                'card_brand' => NULL,
                'card_sub_brand' => NULL,
                'card_issuer_country' => NULL,
                'created_at' => Carbon::now()
            ]);

            return response()->json([
                'success' => true,
                'message' => "Order Payment is Successfull",
                'data' => new OrderResource(Order::where('id', $orderInfo->id)->first())
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function submitProductReview(Request $request){

        $product_id = $request->product_id;
        $userId = auth()->user()->id;
        $rating = $request->rating;
        $review = $request->review;

        $reviewValidity = DB::table('orders')
                            ->join('order_details', 'orders.id', '=', 'order_details.order_id')
                            ->where('orders.user_id', $userId)
                            ->where('order_details.product_id', $product_id)
                            ->first();

        if($reviewValidity){
            $id = ProductReview::insertGetId([
                'product_id' => $product_id,
                'user_id' => $userId,
                'rating' => $rating,
                'review' => $review,
                'slug' => time().str::random(5),
                'status' => 0,
                'created_at' => Carbon::now()
            ]);
            $data = ProductReview::where('id', $id)->first();

            return response()->json([
                'success' => true,
                'message' => "Prouduct Review Submitted",
                'data' => $data
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => "You are not eligible to submit Review for this Product",
                'data' => NULL
            ], 200);
        }
    }

    public function submitProductQuestion(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            ProductQuestionAnswer::insert([
                'product_id' => $request->product_id,
                'full_name' => $request->full_name,
                'email' => $request->email,
                'question' => $request->question,
                'slug' => time().str::random(5),
                'created_at' => Carbon::now()
            ]);

            return response()->json([
                'success' => true,
                'message' => "Question Submitted Successfully"
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getAllTestimonials(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = DB::table('testimonials')->orderBy('id', 'desc')->get();

            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }


    public function subscriptionForUpdates(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $data = SubscribedUsers::where('email', $request->email)->first();

            if($data){
                return response()->json([
                    'success' => true,
                    'message' => "Already Subscribed"
                ], 200);
            } else {
                SubscribedUsers::insert([
                    'email' => $request->email,
                    'created_at' => Carbon::now()
                ]);

                return response()->json([
                    'success' => true,
                    'message' => "Successfully Subscribed"
                ], 200);
            }

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function featuredBrandWiseProducts(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $featuredBrands = Brand::where('featured', 1)->orderBy('serial', 'asc')->get();
            return response()->json([
                'success' => true,
                'data' => BrandResource::collection($featuredBrands)
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

    public function getPaymentGateways(Request $request){
        if ($request->header('Authorization') == ApiController::AUTHORIZATION_TOKEN) {

            $gateways = PaymentGateway::where('status', 1)->get();
            return response()->json([
                'success' => true,
                'data' => $gateways
            ], 200);

        } else {
            return response()->json([
                'success' => false,
                'message' => "Authorization Token is Invalid"
            ], 422);
        }
    }

}
