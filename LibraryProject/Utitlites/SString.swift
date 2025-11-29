//
//  SString.swift
//  LibraryProject
//
//  Created by Yusef Naser on 21/01/2022.
//

struct SString {
    
    static var filter : String { return getText(key: "filter") }
    static var searchByBookName : String {return getText(key: "SearchByBookName")}
    static var viewAll : String {return getText(key: "viewAll")}
    static var newBooks : String {return getText(key: "newBooks")}
    static var featureBooks : String {return getText(key: "featureBooks")}
    static var suggestedBooks : String {return getText(key: "suggestedBooks")}
    static var login : String {return getText(key: "login")}
    static var email : String {return getText(key: "email")}
    static var password : String {return getText(key: "password")}
    static var newPassword : String {return getText(key: "newPassword")}
    static var bookDetails : String {return getText(key: "bookDetails")}
    static var publicationDetails : String {return getText(key: "publicationDetails")}
    static var subjects : String {return getText(key: "subjects")}
    static var DDCClassification : String {return getText(key: "DDCClassification")}
    static var description : String {return getText(key: "description")}
    static var changePassword : String {return getText(key: "changePassword")}
    static var profile : String {return getText(key: "profile")}
    static var update : String {return getText(key: "update")}
    static var name : String {return getText(key: "name")}
    static var cardNumber : String {return getText(key: "cardNumber")}
    static var address : String {return getText(key: "address")}
    static var menu : String {return getText(key: "menu")}
    static var checkoutList : String {return getText(key: "checkoutList")}
    static var suggestions : String {return getText(key: "suggestions")}
    static var addSuggest : String {return getText(key: "addSuggest")}
    static var title : String { return getText(key: "title")}
    static var titleBook : String { return getText(key: "titleBook")}
    
    static var abstract : String { return getText(key: "abstract")}

    static var author : String { return getText(key: "author")}
    static var copyrightDate : String { return getText(key: "copyrightDate")}
    static var publisher : String { return getText(key: "publisher")}
    static var collectionTitle : String { return getText(key: "collectionTitle")}
    static var publicationPlace : String { return getText(key: "publicationPlace")}
    static var quantity : String { return getText(key: "quantity")}
    static var itemType : String { return getText(key: "itemType")}
    static var library : String { return getText(key: "library")}
    static var notes : String { return getText(key: "notes")}
    static var submit : String { return getText(key: "submit")}
    static var holdList : String { return getText(key: "holdList")}
    static var addCheckout : String { return getText(key: "addCheckout")}
    static var city : String { return getText(key: "city")}
    static var categoryID : String { return getText(key: "categoryID")}
    static var libraryID : String { return getText(key: "libraryID")}
    static var repeatedPassword : String { return getText(key: "repeatedPassword")}
    static var oldPassword : String { return getText(key: "oldPassword")}
    static var addHold : String {return getText(key: "addHold")}
    static var logout : String {return getText(key: "logout")}
    static var checkin : String {return getText(key: "checkin")}
    static var checkout : String {return getText(key: "checkout")}
    static var close : String {return getText(key: "close")}
    static var home : String {return getText(key: "home")}
    static var favorite : String {return getText(key: "favorite")}
    static var callNumber : String {return getText(key: "callNumber")}
    static var changeLanguage : String {return getText(key: "changeLanguage")}
    static var settings : String {return getText(key: "settings")}
    static var more : String {return getText(key: "more")}
    static var items : String {return getText(key: "items")}
    static var SelectDeliveryDate : String { return getText(key: "SelectDeliveryDate")}
    static var cancel : String { return getText(key: "cancel")}
    static var done : String { return getText(key: "done")}
    static var pleaseAddDateAndCardNumber : String { return getText(key: "pleaseAddDateAndCardNumber")}
    static var ShelvingControlNumber : String { return getText(key: "ShelvingControlNumber")}
    static var barcode : String { return getText(key: "barcode")}
    static var enterYourUsernameAndPassword : String { return getText(key: "enterYourUsernameAndPassword")}
    static var goodMorning : String { return getText(key: "goodMorning")}
    static var welcomeTawazun : String { return getText(key: "welcomeTawazun")}
    static var by : String { return getText(key: "by")}
    static var aboutTheBook : String { return getText(key: "aboutTheBook")}
    static var youHavenotMarkedAnyBookYet : String { return getText(key: "youHavenotMarkedAnyBookYet")}
    static var noResultsFoundTryAnotherKeyboards : String { return getText(key: "noResultsFoundTryAnotherKeyboards")}
    static var type : String { return getText(key: "type")}
    static var select : String { return getText(key: "select")}
    static var branches : String { return getText(key: "branches")}
    static var fax : String { return getText(key: "fax")}
    static var postalCode : String { return getText(key: "postalCode")}
    static var ok : String { return getText(key: "ok")}
    static var changingLangugeRequiredRestartApp : String { return getText(key: "changingLangugeRequiredRestartApp")}
    static var theresNoCheckoutList : String { return getText(key: "theresNoCheckoutList")}
    static var theresNoHold : String { return getText(key: "theresNoHold")}
    static var youHaveNoSuggestion : String { return getText(key: "youHaveNoSuggestion")}
    static var thereIsNoBranches : String { return getText(key: "thereIsNoBranches")}
    static var onboard1 : String { return getText(key: "onboard1")}
    static var onboard2 : String { return getText(key: "onboard2")}
    static var onboard3 : String { return getText(key: "onboard3")}
    static var finish : String { return getText(key: "finish")}
    static var next : String { return getText(key: "next")}
    static var holdDate : String { return getText(key: "holdDate")}
    static var privacy : String { return getText(key: "privacy")}
    
    
    

    private static func getText (key : String) -> String {
        if SharedData.instance.getLangauge().contains(LanguageEnum.en.rawValue) {
         return   dicEN[key] ?? key
        }else {
         return    dicAR[key] ?? key
        }
        
    }
  
    private static let dicEN : [String : String] = [
        "filter" : "Filter" ,
        "SearchByBookName" : "Search by book name, author..." ,
        "viewAll" : "View all" ,
        "newBooks" : "New books" ,
        "featureBooks" : "Feature books" ,
        "suggestedBooks" : "Suggested books" ,
        "login" : "Login" ,
        "email" : "Email" ,
        "password" : "Password" ,
        "newPassword" : "New Password" ,
        "bookDetails" : "Book details" ,
        "publicationDetails" : "publication Details" ,
        "subjects" : "Subjects" ,
        "DDCClassification" : "DDC Classification" ,
        "description" : "Description" ,
        "changePassword" : "Change Password" ,
        "profile" : "Profile" ,
        "update" : "Update" ,
        "name" : "Name" ,
        "cardNumber" : "Card Number" ,
        "address" : "Address" ,
        "menu" : "Menu" ,
        "checkoutList" : "Checkout List" ,
        "suggestions" : "Suggestions" ,
        "addSuggest" : "Add Suggest" ,
        "title" : "Title" ,
        "titleBook" : "Title Book" ,
        "author" : "Author" ,
        "copyrightDate" : "Copyright Date" ,
        "publisher" : "Publisher" ,
        "abstract" : "Abstract" ,
        "collectionTitle" : "Collection title" ,
        "publicationPlace" : "Publication Place" ,
        "quantity" : "Quantity" ,
        "itemType" : "Item type" ,
        "library" : "Library" ,
        "notes" : "Notes" ,
        "submit" : "Submit" ,
        "holdList" : "Hold List" ,
        "addCheckout" : "Add Checkout" ,
        "city" : "City" ,
        "categoryID" : "Category ID" ,
        "libraryID" : "Library ID" ,
        "repeatedPassword" : "Confirm New Password" ,
        "oldPassword" : "Current Password" ,
        "addHold" : "Add hold" ,
        "logout" : "Logout" ,
        "checkin" : "Checkin" ,
        "checkout" : "checkout",
        "close" : "Close" ,
        "home" : "Home" ,
        "favorite" : "Favorite" ,
        "callNumber" : "Call Number" ,
        "ShelvingControlNumber" :  "Shelving Control Number" ,
        "changeLanguage" : "Change Language" ,
        "settings" : "Settings" ,
        "more" : "More" ,
        "items" : "Items" ,
        "SelectDeliveryDate" : "Select Date of return" ,
        "cancel" : "Cancel" ,
        "done" : "Done" ,
        "barcode" : "Bar Code" ,
        "pleaseAddDateAndCardNumber" : "Please add date and card number" ,
        "enterYourUsernameAndPassword" : "Enter your username and password." ,
        "goodMorning" : "Good Morning." ,
        "welcomeTawazun" : "Welcome to TAWAZUN!." ,
        "by" : "By" ,
        "aboutTheBook" : "About The Book",
        "youHavenotMarkedAnyBookYet" : "You Haven't marked any book yet",
        "noResultsFoundTryAnotherKeyboards" : "No Results Found\nTry Another Keyboards",
        "type" : "Type",
        "select" : "Select",
        "branches" : "Branches",
        "fax" : "Fax",
        "postalCode" : "Postal Code",
        "changingLangugeRequiredRestartApp" : "Changing Language Required Restart app",
        "ok" : "OK",
        "theresNoCheckoutList" : "There is no checkout list",
        "theresNoHold" : "There is no Hold list",
        "youHaveNoSuggestion" : "You have no suggestion",
        "thereIsNoBranches" : "There is no branches",
        "onboard1" : "Discover and explore a wide collection of books that match your interests and curiosity",
        "onboard2" : "Easily borrow any book you love by sending a quick request right from the app",
        "onboard3" : "Save your favorite books to build your own reading list and access them anytime.",
        "finish" : "Finish",
        "next" : "Next",
        "holdDate" : "Hold Date",
        "privacy" : "privacy Policy",
        
        
    ]
    
    private static let dicAR : [String : String] = [
        "filter" : "فلتر" ,
        "SearchByBookName" : "البحث حسب اسم الكتاب أو المؤلف..." ,
        "viewAll" : "مشاهده الكل" ,
        "newBooks" : "الكتب الجديده" ,
        "featureBooks" : "الكتب المميزه" ,
        "suggestedBooks" : "الكتب المقترحة" ,
        "login" : "تسجيل دخول" ,
        "email" : "ايميل" ,
        "password" : "كلمه المرور" ,
        "newPassword" : "كلمه المرور الجديدة" ,
        "bookDetails" : "تفاصيل الكتاب" ,
        "publicationDetails" : "تفاصيل الناشر" ,
        "subjects" : "الموضوعات" ,
        "DDCClassification" : "DDC Classification" ,
        "description" : "الوصف" ,
        "changePassword" : "تغير كلمه المرور" ,
        "profile" : "الملف الشخصي" ,
        "update" : "تحديث" ,
        "name" : "الاسم" ,
        "cardNumber" : "رقم الكارت" ,
        "address" : "العنوان" ,
        "menu" : "القائمه" ,
        "checkoutList" : "قائمه الاستعارات" ,
        "suggestions" : "الاقتراحات" ,
        "addSuggest" : "اضف اقتراح" ,
        "title" : "العنوان" ,
        "titleBook" : "عنوان الكتاب" ,
        "author" : "الكاتب" ,
        "copyrightDate" : "تاريخ الاصدار" ,
        "publisher" : "الناشر" ,
        "abstract" : "الملخص" ,
        "collectionTitle" : "عنوان المجموعه" ,
        "publicationPlace" : "مكان الناشر" ,
        "quantity" : "الكميه" ,
        "itemType" : "نوع الكتاب" ,
        "library" : "مكتبه" ,
        "notes" : "ملاحظات" ,
        "submit" : "ارسال" ,
        "holdList" : "قائمه الحجز" ,
        "addCheckout" : "اضف الي الحجز" ,
        "city" : "المدينه" ,
        "categoryID" : "الفئه" ,
        "libraryID" : "المكتبه" ,
        "repeatedPassword" : "تأكيد كلمة المرور الجديدة" ,
        "oldPassword" : "كلمه المرور الحالية" ,
        "addHold" : "اضف الي الحجز" ,
        "logout" : "تسجيل خروج" ,
        "checkin" : "ارجاع" ,
        "checkout" : "استعاره",
        "close" : "اغلاق" ,
        "home" : "الرئيسيه" ,
        "favorite" : "المفضله" ,
        "callNumber" : "رقم الطلب" ,
        "ShelvingControlNumber" : "رقم الرف" ,
        "changeLanguage" : "تفير اللغه" ,
        "settings" : "الاعدادات" ,
        "more" : "اكثر" ,
        "items" : "العناصر" ,
        "SelectDeliveryDate" : "اختر تاريخ التسليم" ,
        "cancel" : "الغاء" ,
        "done" : "تم" ,
        "barcode" : "البار كود" ,
        "pleaseAddDateAndCardNumber" : "من فضلك اضف التاريخ و رقم الكارت" ,
        "enterYourUsernameAndPassword" : "أدخل اسم المستخدم وكلمة المرور." ,
        "goodMorning" : "صباح الخير" ,
        "welcomeTawazun" : "مرحبا بك في TAWAZUN!." ,
        "by" : "بواسطة" ,
        "aboutTheBook" : "عن الكتاب" ,
        "youHavenotMarkedAnyBookYet" : "لم تقم بإضافة أي كتاب إلى المفضلة بعد",
        "noResultsFoundTryAnotherKeyboards" : "لم يتم العثور على نتائج\nجرب لوحة مفاتيح أخرى",
        "type" : "اكتب",
        "select" : "اختر",
        "branches" : "الفروع",
        "fax" : "فاكس",
        "postalCode" : "الرمز البريدي",
        "changingLangugeRequiredRestartApp" : "تغير اللغة يتطلب اعادة تشغيل التطبيق",
        "ok" : "موافق",
        "theresNoCheckoutList" : "لا يوجد قائمة استعارات",
        "theresNoHold" : "لا يوجد قائمة للحجز",
        "youHaveNoSuggestion" : "لايوجد اقتراحات",
        "thereIsNoBranches" : "لا يوجد فروع",
        "onboard1" : "اكتشف واستكشف مجموعة واسعة من الكتب التي تناسب اهتماماتك وفضولك.",
        "onboard2" : "استعر أي كتاب تحبه بسهولة عبر إرسال طلب سريع مباشرة من داخل التطبيق.",
        "onboard3" : "احفظ كتبك المفضلة لبناء قائمة القراءة الخاصة بك والوصول إليها في أي وقت.",
        "finish" : "إنهاء",
        "next" : "التالي",
        "holdDate" : "تاريخ الحجز",
        "privacy" : "سياسة الخصوصية",
        
    ]
    
}
