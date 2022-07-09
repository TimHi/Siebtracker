// main.go
package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type Coffee struct {
	Id        string `json:"Id"`
	SettingId string `json:"SettingId"`
	BeanId    string `json:"BeanId"`
	RatingId  string `json:"RatingId"`
	UserId    string `json:"UserId"`
}

type Setting struct {
	Id              string `json:"Id"`
	Ratio           string `json:"Ratio"`
	ExtractionTime  string `json:"ExtractionTime"`
	CoarseWeight    string `json:"CoarseWeight"`
	ExtractedWeight string `json:"ExtractedWeight"`
}

type Bean struct {
	Id       string `json:"Id"`
	Title    string `json:"Title"`
	Desc     string `json:"Desc"`
	Producer string `json:"Producer"`
	Image    string `json:"Image"`
}

type Rating struct {
	Id         string `json:"Id"`
	Body       string `json:"Body"`
	Taste      string `json:"Taste"`
	Bitterness string `json:"Bitterness"`
	Sourness   string `json:"Sourness"`
}

type User struct {
	Id    string `json:"Id"`
	Name  string `json:"Name"`
	Image string `json:"Image"`
}

var Coffees []Coffee
var Settings []Setting
var Beans []Bean
var Ratings []Rating
var Users []User

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, `Welcome to the Siebtracker Backend! Here you find dummy data for the Siebtracker App`)
	fmt.Println("Endpoint Hit: homePage")
}

func returnAllCoffees(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Endpoint Hit: returnAllCoffees")
	json.NewEncoder(w).Encode(Coffees)
}

func returnAllSettings(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Endpoint Hit: returnAllSettings")
	json.NewEncoder(w).Encode(Settings)
}

func returnAllBeans(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Endpoint Hit: returnAllBeans")
	json.NewEncoder(w).Encode(Beans)
}

func returnAllRatings(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Endpoint Hit: returnAllRatings")
	json.NewEncoder(w).Encode(Ratings)
}

func returnAllUsers(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Endpoint Hit: returnAllUsers")
	json.NewEncoder(w).Encode(Users)
}

func returnSettingById(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	key := vars["id"]
	for _, setting := range Settings {
		if setting.Id == key {
			json.NewEncoder(w).Encode(setting)
		}
	}
}

func returnBeanById(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	key := vars["id"]
	for _, bean := range Beans {
		if bean.Id == key {
			json.NewEncoder(w).Encode(bean)
		}
	}
}

func returnCoffeeById(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	key := vars["id"]
	for _, bean := range Coffees {
		if bean.Id == key {
			json.NewEncoder(w).Encode(bean)
		}
	}
}

func returnUserById(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	key := vars["id"]
	for _, user := range Users {
		if user.Id == key {
			json.NewEncoder(w).Encode(user)
		}
	}
}

func returnRatingById(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	key := vars["id"]
	for _, rating := range Ratings {
		if rating.Id == key {
			json.NewEncoder(w).Encode(rating)
		}
	}
}

func handleRequests() {
	myRouter := mux.NewRouter().StrictSlash(true)
	myRouter.HandleFunc("/", homePage)
	myRouter.HandleFunc("/coffees", returnAllCoffees)
	myRouter.HandleFunc("/settings", returnAllSettings)
	myRouter.HandleFunc("/beans", returnAllBeans)
	myRouter.HandleFunc("/ratings", returnAllRatings)
	myRouter.HandleFunc("/users", returnAllUsers)
	myRouter.HandleFunc("/settings/{id}", returnSettingById)
	myRouter.HandleFunc("/coffees/{id}", returnCoffeeById)
	myRouter.HandleFunc("/beans/{id}", returnBeanById)
	myRouter.HandleFunc("/users/{id}", returnUserById)
	myRouter.HandleFunc("/ratings/{id}", returnRatingById)
	log.Fatal(http.ListenAndServe(":10000", myRouter))
}

func main() {
	Coffees = []Coffee{
		{Id: "10", SettingId: "20", BeanId: "30", RatingId: "40", UserId: "50"},
		{Id: "11", SettingId: "20", BeanId: "30", RatingId: "41", UserId: "50"},
		{Id: "12", SettingId: "21", BeanId: "31", RatingId: "42", UserId: "50"},
		{Id: "13", SettingId: "22", BeanId: "32", RatingId: "43", UserId: "50"},
		{Id: "14", SettingId: "23", BeanId: "30", RatingId: "44", UserId: "50"},
	}
	Settings = []Setting{
		{Id: "20", Ratio: "1:2", ExtractionTime: "20", CoarseWeight: "14", ExtractedWeight: "36"},
		{Id: "21", Ratio: "1:2", ExtractionTime: "20", CoarseWeight: "14", ExtractedWeight: "36"},
		{Id: "22", Ratio: "1:2", ExtractionTime: "20", CoarseWeight: "14", ExtractedWeight: "36"},
		{Id: "23", Ratio: "1:2", ExtractionTime: "20", CoarseWeight: "14", ExtractedWeight: "36"},
	}
	Beans = []Bean{
		{Id: "30", Title: "Aal Kaffee", Desc: "Aals Röstung", Producer: "Aal Rösterei", Image: "https://www.bund-sh.de/fileadmin/sh/Graphisches/Sonstige_Groesse/Meere/2017-08-28_FO_Aal_Tobias_Dahlin.jpg"},
		{Id: "31", Title: "Aal 2", Desc: "Aals Röstung", Producer: "Aal Rösterei", Image: "https://www.bund-sh.de/fileadmin/sh/Graphisches/Sonstige_Groesse/Meere/2017-08-28_FO_Aal_Tobias_Dahlin.jpg"},
		{Id: "32", Title: "Kein Bild", Desc: "", Producer: "Aal Rösterei", Image: ""},
	}

	Ratings = []Rating{
		{Id: "40", Body: "5", Taste: "3", Bitterness: "3", Sourness: "4"},
		{Id: "41", Body: "2", Taste: "2", Bitterness: "3", Sourness: "4"},
		{Id: "42", Body: "4", Taste: "3", Bitterness: "3", Sourness: "4"},
		{Id: "43", Body: "1", Taste: "1", Bitterness: "3", Sourness: "4"},
		{Id: "44", Body: "0", Taste: "0", Bitterness: "0", Sourness: "0"},
	}
	Users = []User{
		{Id: "50", Name: "Tim", Image: "https://upload.wikimedia.org/wikipedia/commons/c/c0/Schumacher_china_2012_crop.jpg"},
	}
	handleRequests()
}
