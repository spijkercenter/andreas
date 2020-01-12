import { anyone } from "./accessability";

class Branch {
    
    @anyone()
    id: String;

    @anyone()
    name: String;

    constructor(id: String, name: String) {
        this.id = id;
        this.name = name;
    }
}

export default Branch;