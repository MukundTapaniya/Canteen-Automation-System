<!DOCTYPE html>
<html lang="en">

<?php
include("../connection/connect.php");
include("../product-action.php");

error_reporting(0);
session_start();

function function_alert()
{
  echo "<script>alert('Thank you. Your Order has been placed!');</script>";
  echo "<script>window.location.href='http://localhost/Cp-III/your_orders.php';</script>";

}

if (empty($_SESSION["user_id"])) {
  header('location:login.php');
} else {
  if (isset($_POST['submit'])) {
    // Extract and sanitize input data
    $nameOnCard = mysqli_real_escape_string($db, $_POST['name']);
    $cardNumber = mysqli_real_escape_string($db, $_POST['card_number']);
    $expiry = mysqli_real_escape_string($db, $_POST['expiry']);
    $cvv = mysqli_real_escape_string($db, $_POST['cvv']);
    $streetAddress = mysqli_real_escape_string($db, $_POST['street_address']);
    $city = mysqli_real_escape_string($db, $_POST['city']);
    $stateProvince = mysqli_real_escape_string($db, $_POST['state_province']);
    $zipCode = mysqli_real_escape_string($db, $_POST['zip_code']);

    // Construct SQL query for data insertion
    $SQL = "INSERT INTO onlinepayment (name_on_card, card_number, expiry, cvv, street_address, city, state_province, zip_code)
                VALUES ('$nameOnCard', '$cardNumber', '$expiry', '$cvv', '$streetAddress', '$city', '$stateProvince', '$zipCode')";

    // Execute the query using Procedural MySQLi
    if (mysqli_query($db, $SQL)) {
      // Check if $_SESSION["cart_item"] is set and not empty
      if (isset($_SESSION["cart_item"]) && !empty($_SESSION["cart_item"])) {
        $item_total = 0;

        // Loop through each item in the cart
        foreach ($_SESSION["cart_item"] as $item) {
          $item_total += ($item["price"] * $item["quantity"]);
        }

        foreach ($_SESSION["cart_item"] as $item) {
          $SQL = "INSERT INTO users_orders (u_id, title, quantity, price) VALUES ('" . $_SESSION["user_id"] . "','" . $item["title"] . "','" . $item["quantity"] . "','" . $item["price"] . "')";
          mysqli_query($db, $SQL);

          // Unset the item in the cart
          unset($item);
        }

        // Unset the entire cart
        unset($_SESSION["cart_item"]);

        $success = "Thank you. Your order has been placed!";
        function_alert();

      } else {
        // $_SESSION["cart_item"] is not available or empty
        // You can handle this case or show a message to the user
        echo "Your cart is empty.";
      }

      unset($_SESSION["cart_item"]);
      $success = "Thank you. Your order has been placed!";
      function_alert();
    } else {
      // Handle the case where the insert operation failed.
      echo "Error: " . mysqli_error($db);
    }
  }
}

?>


<head>
  <title>Payment</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    body {

      background-color: #eee;
    }

    .container {

      height: 100vh;

    }

    .card {
      border: none;
    }

    .form-control {
      border-bottom: 2px solid #eee !important;
      border: none;
      font-weight: 600
    }

    .form-control:focus {
      color: #495057;
      background-color: #fff;
      border-color: #8bbafe;
      outline: 0;
      box-shadow: none;
      border-radius: 0px;
      border-bottom: 2px solid blue !important;
    }



    .inputbox {
      position: relative;
      margin-bottom: 20px;
      width: 100%
    }

    .inputbox span {
      position: absolute;
      top: 7px;
      left: 11px;
      transition: 0.5s
    }

    .inputbox i {
      position: absolute;
      top: 13px;
      right: 8px;
      transition: 0.5s;
      color: #3F51B5
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
      -webkit-appearance: none;
      margin: 0
    }

    .inputbox input:focus~span {
      transform: translateX(-0px) translateY(-15px);
      font-size: 12px
    }

    .inputbox input:valid~span {
      transform: translateX(-0px) translateY(-15px);
      font-size: 12px
    }

    .card-blue {

      background-color: #492bc4;
    }

    .hightlight {

      background-color: #5737d9;
      padding: 10px;
      border-radius: 10px;
      margin-top: 15px;
      font-size: 14px;
    }

    .yellow {

      color: #fdcc49;
    }

    .decoration {

      text-decoration: none;
      font-size: 14px;
    }

    .btn-success {
      color: #fff;
      background-color: #492bc4;
      border-color: #492bc4;
    }

    .btn-success:hover {
      color: #fff;
      background-color: #492bc4;
      border-color: #492bc4;
    }


    .decoration:hover {

      text-decoration: none;
      color: #fdcc49;
    }
  </style>

<body>
  <div class="container mt-5 px-5">
    <div class="mb-4">
      <h2>Confirm order and pay</h2>
      <span>please make the payment, after that you can enjoy all the features and benefits.</span>
    </div>

    <form method="post">
      <div class="row">
        <div class="col-md-8">
          <div class="card p-3">
            <h6 class="text-uppercase">Payment details</h6>
            <div class="inputbox mt-3">
              <input type="text" name="name" class="form-control" required="required">
              <span>Name on card</span>
            </div>
            <div class="inputbox mt-3">
              <input type="text" name="card_number" class="form-control" required="required">
              <span>Card Number</span>
            </div>

            <div class="row">
              <div class="col-md-6">
                <div class="inputbox mt-3 mr-2">
                  <input type="text" name="expiry" class="form-control" required="required">
                  <span>Expiry</span>
                </div>
              </div>
              <div class="col-md-6">
                <div class="d-flex flex-row">
                  <div class="inputbox mt-3 mr-2">
                    <input type="text" name="cvv" class="form-control" required="required">
                    <span>CVV</span>
                  </div>
                </div>
              </div>
            </div>

            <div class="mt-4 mb-4">
              <h6 class="text-uppercase">Billing Address</h6>
              <div class="row mt-3">
                <div class="col-md-6">
                  <div class="inputbox mt-3 mr-2">
                    <input type="text" name="street_address" class="form-control" required="required">
                    <span>Street Address</span>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="inputbox mt-3 mr-2">
                    <input type="text" name="city" class="form-control" required="required">
                    <span>City</span>
                  </div>
                </div>
              </div>
              <div class="row mt-2">
                <div class="col-md-6">
                  <div class="inputbox mt-3 mr-2">
                    <input type="text" name="state_province" class="form-control" required="required">
                    <span>State/Province</span>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="inputbox mt-3 mr-2">
                    <input type="text" name="zip_code" class="form-control" required="required">
                    <span>Zip code</span>
                  </div>
                </div>
              </div>
            </div>


            <div class="mt-4 mb-4 d-flex justify-content-between">
              <button class="btn btn-success px-3" name="submit" type="submit">Submit</button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</body>

</html>