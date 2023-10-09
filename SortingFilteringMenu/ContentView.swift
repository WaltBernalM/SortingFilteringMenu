import SwiftUI
import CoreData

struct ContentView: View {
    
    enum SortBy:String {
        case name = "name"
        case price = "price"
    }
    
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var searchText = ""
    @State var sortBy = SortBy.name
    @State var sortByPrice = false
    
    
    var body: some View {
        NavigationView {
            VStack{
                Text("DESSERTS")
                    .font(.title)
                
                FetchedObjects(
                    predicate:buildPredicate(),
                    sortDescriptors: buildSortDescriptors())
                { (desserts: [Dessert]) in
                    
                    List {
                        ForEach(desserts, id:\.self) { dessert in
                            VStack(alignment:.leading){
                                Text (dessert.name!)
                                    .font(.system(size: 16, weight: .bold))
                                
                                HStack{
                                    Text (dessert.size!)
                                    Spacer()
                                    Text("$\(dessert.price, specifier: "%.2f")")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                }
                            }
                        }
                    }
                    
                    .searchable(text: $searchText,
                                prompt: "search...")
                }
                
                VStack (alignment: .center) {
                    HStack{
                        Toggle(isOn: $sortByPrice) {
                            HStack{
                                Spacer()
                                Text("Sort by price")
                                    .font(.callout)
                            }
                            
                        }
                        Spacer()
                    }
                }
                .onChange(of: sortByPrice) { newValue in
                    sortBy = newValue ? SortBy.price : SortBy.name
                }
                .padding([.leading, .trailing], 60)
            }
        }
    }
    
    
    func buildPredicate() -> NSPredicate {
        NSPredicate()
    }
    
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        []
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





