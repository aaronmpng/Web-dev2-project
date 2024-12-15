<?php

namespace Controllers;

use Exception;
use Services\ProductService;

class ProductController extends Controller
{
    private $service;

    // initialize services
    function __construct()
    {
        $this->service = new ProductService();
    }

    public function getAll()
    {
        if(!isset($_SERVER["HTTP_AUTHORIZATION"])) {
        $this->respondWithError(401, "Je mag er niet in");
        return;
        }

        $offset = NULL;
        $limit = NULL;

        if(isset($_GET["offset"]) && is_numeric($_GET["offset"])){
            $offset = $_GET["offset"];
        }

        if(isset($_GET["limit"]) && is_numeric($_GET["limit"])){
            $limit = $_GET["limit"];
        }

        $product = $this->service->getAll($offset, $limit);
        $this->respond($product);
    }

    public function getOne($id)
    {
        $product = $this->service->getOne($id);

        if(!$product){
            $this->respondWithError(404, "Product not found");
            return;
        }
        $this->respond($product);
    }

    public function create()
    {
        try {
            $product = $this->createObjectFromPostedJson("Models\Product");
            // something is missing. Shouldn't we update the product in the DB?
            $this->service->insert($product);

        } catch (Exception $e) {
            $this->respondWithError(500, $e->getMessage());
        }

        $this->respond($product);
    }

    public function update($id)
    {
        // There is no code here

        try {
            $product = $this->createObjectFromPostedJson("Models\Product");
            // something is missing. Shouldn't we update the product in the DB?
            $this->service->update($product, $id);

        } catch (Exception $e) {
            $this->respondWithError(500, $e->getMessage());
        }

        $this->respond($product);
    } 

    public function delete($id){
                try {
                    $this->service->delete($id);
                    $this->respond(["success" => true, "message" => "Product deleted"], 200);
        
                } catch (Exception $e) {
                    $this->respondWithError(500, $e->getMessage());
                }
    }
}
