document.addEventListener('DOMContentLoaded', ()=> {
    console.log('Live from BookaTutor');

    let addButton = [].slice.call(document.getElementsByClassName('add-button'));

    addButton.forEach((a) => {
        a.addEventListener('click', (event) => {
            event.preventDefault()
    
            let rootParent = a.parentElement.parentElement;
            let rootParentChildren = rootParent.children;
            let rootParentChildrenArray = [].slice.call(rootParent.children);
    
            function getHiddenCount() {
                let hiddenCount = rootParentChildrenArray.filter((r) => {
                    return r.classList.contains('hide')
                })
                return hiddenCount
            }
    
            var hiddenCount = getHiddenCount();
    
            
    
            if(hiddenCount != 0) {
                hiddenCount[0].classList.remove('hide')
                let hidden = getHiddenCount();
                if(hidden == 0) {
                    a.classList.add('hide')
                }
    
            } else {
                
            }
    
        })
    })

    


})