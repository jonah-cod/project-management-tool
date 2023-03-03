const express = require('express');
require('dotenv').config()
const app = express();

app.use(express.json());
const PORT = process.env.PORT || 4040;

app.get('/', (req, res)=>{
      res.send("All system at a go!")
})



app.listen(PORT, ()=>console.log(`App running at por: ${PORT}`))
