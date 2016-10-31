<?php
session_start();
require_once("/php/twitteroauth/twitteroauth.php");

$twitteruser = "ThresherAV";
$notweets = 5;
$consumerkey = "k4O569LGRSnwTB3iQE8aIQ";
$consumersecret = "v0B8cL8sHsJRAoZWWCEVUgEehuKLMiu1qaRHWzrYtI";
$accesstoken = "1732943922-7U6GIu83RBYuTGhJVnIrMJkAML8BFVyXpgs1Rqf";
$accesstokensecret = "fBeyEd5xztsd2Thgd1wXp0luEqxcSyiGwVdMh1Tt4M";

function getConnectionWithAccessToken($cons_key, $cons_secret, $oauth_token, $oauth_token_secret) {
	$connection = new TwitterOAuth($cons_key, $cons_secret, $oauth_token, $oauth_token_secret);
	return $connection;
}

$connection = getConnectionWithAccessToken($consumerkey, $consumersecret, $accesstoken, $accesstokensecret);
$tweets = $connection->get("https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=".$twitteruser."&count=".$notweets);

echo json_encode($tweets);
?>