<?php

class NewsLetter extends DbObject {
    // name of database table
    const DB_TABLE = 'newsletter_signup';

    // database fields
    protected $id;
    protected $Name;
    protected $Email;

   // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'Name' => null,
            'Email' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->Email = $args['Email'];
        $this->Name = $args['Name'];
    }   

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'Name' => $this->Name,
            'Email' => $this->Email
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }
}