<?php

class TreeHandler extends Controller{

    public static function return_tree(){
        $conn = self::connect();
        $tree_id = $_POST['tree_id'];
        $sql = "SELECT description.tree_id, node_id, first_name, last_name, 
        child_node_id, age, spouse_name, level, date_of_birth FROM relationship 
        RIGHT JOIN description ON par_node_id = node_id and 
        description.tree_id = relationship.tree_id WHERE description.tree_id = $tree_id";
        $result = $conn->query($sql);

        $dictionary = [];

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                if(array_key_exists($row['node_id'],$dictionary)){
                    array_push($dictionary[$row['node_id']]['children'], $row['child_node_id']);
                }
                else{
                    $dictionary[$row['node_id']] = [];
                    $dictionary[$row['node_id']]['name'] = $row['first_name'].' '.$row['last_name'];
                    $dictionary[$row['node_id']]['age'] = $row['age'];
                    $dictionary[$row['node_id']]['spouse'] = $row['spouse_name'];
                    $dictionary[$row['node_id']]['level'] = $row['level'];
                    $dictionary[$row['node_id']]['id'] = $row['node_id'];
                    $dictionary[$row['node_id']]['birth'] = $row['date_of_birth'];
                    $dictionary[$row['node_id']]['children'] = [];
                    array_push($dictionary[$row['node_id']]['children'], $row['child_node_id']);
                }
            }
        }
        return $dictionary;
    }

}

?>